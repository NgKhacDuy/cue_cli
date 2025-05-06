import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:pubspec_yaml/pubspec_yaml.dart';

class CliInfo {
  CliInfo._();

  static String get version {
    final pubspecFile = File('$getPackageRoot/pubspec.yaml');

    if (!pubspecFile.existsSync()) {
      return '0.0.0'; // Default version if can't be determined
    }

    final pubspecContent = pubspecFile.readAsStringSync();
    final pubspec = PubspecYaml.loadFromYamlString(pubspecContent);
    return pubspec.version.valueOr(getVersion);
  }

  static String getVersion() {
    return "0.0.0";
  }

  static String get getPackageRoot {
    // When running globally installed, use executable path to find package root
    final executablePath = Platform.script.toFilePath();
    final binDir = path.dirname(executablePath);
    return path.dirname(binDir); // Go up one level from bin directory
  }
}
