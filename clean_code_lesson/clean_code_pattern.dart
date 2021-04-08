import 'package:flutter/cupertino.dart';

class MyMain {
  // Инициализация в UI
  HomeState homeState = HomeModule.homeState();
  // Использование в UI, меняет state (на шаге-в HomeState->getDay)
  // homeState.getDay(latitude: 1.0, longitude: 1.0);

}

// Инициализация HomeState, в конструктор RepositoryModule
class HomeModule {
  static HomeState homeState() =>
      HomeState(dayRepository: RepositoryModule.dayRepository());
}

class HomeState {
  HomeState({@required this.dayRepository});
  DayRepository dayRepository;

  Day day;
  bool isLoading = false;

  // пробрасывает параметры и меняет состояние
  Future<void> getDay(
      {@required double latitude, @required double longitude}) async {
    isLoading = true;
    final data =
        await dayRepository.getDay(latitude: latitude, longitude: longitude);
    day = data;
    isLoading = false;
  }
}

// Инициализация DayDataRepository, в конструктор ApiModule
class RepositoryModule {
  static DayRepository dayRepository() =>
      DayDataRepository(ApiModule.apiUtil());
}

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  // пробрасывает параметры дальше
  @override
  Future<Day> getDay({double latitude, double longitude}) {
    return _apiUtil.getDay(latitude: latitude, longitude: longitude);
  }
}

// Инициализация ApiUtil, в конструктор SunriseSernice
class ApiModule {
  static ApiUtil apiUtil() => ApiUtil(SunriseService());
}

class ApiUtil {
  final SunriseService sunriseService;

  ApiUtil(this.sunriseService);

  Future<Day> getDay({
    @required double latitude,
    @required double longitude,
  }) async {
    //final body = GetDayBody(latitude: latitude, longitude: longitude);
    //final result = await _sunriseService.getDay(body);
    //return DayMapper.fromApi(result);
    return Day(); // вместо трех верхних строк, что бы не было ошибки :)
  }
}

class Day {
  /*
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime solarNoon;
  final int dayLength;
  */
}

class SunriseService {
  static const _BASE_URL = 'https://api.sunrise-sunset.org';
/*
  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiDay> getDay(GetDayBody body) async {
    final response = await _dio.get(
      '/json',
      queryParameters: body.toApi(),
    );
    return ApiDay.fromApi(response.data);
  }
  */
}

abstract class DayRepository {
  Future<Day> getDay({
    @required double latitude,
    @required double longitude,
  });
}
