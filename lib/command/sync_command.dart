import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:cue_cli/helper/logs.dart';

class SyncCommand extends Command {
  @override
  String get description => "Sync the project";

  @override
  String get name => "sync";

  @override
  Future<void> run() async {
    final result = await Process.run('dart', [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ], runInShell: true);

    if (result.stdout.toString().trim().isNotEmpty) {
      Logs.i(result.stdout);
    }

    if (result.stderr.toString().trim().isNotEmpty) {
      Logs.e(result.stderr);
    }
    if (result.exitCode != 0) {
      Logs.e('Build failed with exit code ${result.exitCode}');
      exit(result.exitCode);
    }

    Logs.i('Build completed successfully!');
  }
}
