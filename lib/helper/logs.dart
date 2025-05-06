import 'package:logger/logger.dart';

class Logs {
  const Logs._();

  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 3,
      lineLength: 80,
      printEmojis: true,
      noBoxingByDefault: true,
      excludeBox: {Level.error: true},
    ),
    level: Level.debug,
  );

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.d(message);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message);
  }

  static void v(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.i(message);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.w(message);
  }

  static void wtf(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger.f(message);
  }

  static void close() {
    _logger.close();
  }
}
