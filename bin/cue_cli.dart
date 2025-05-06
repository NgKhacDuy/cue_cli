import 'package:args/command_runner.dart';
import 'package:cue_cli/command/sync_command.dart';
import 'package:cue_cli/command/update_command.dart';
import 'package:cue_cli/helper/cli_info.dart';
import 'package:cue_cli/helper/logs.dart';

void main(List<String> arguments) async {
  final runner =
      CommandRunner("cue", "Cue cli")
        ..addCommand(SyncCommand())
        ..addCommand(UpdateCommand())
        ..argParser.addFlag(
          'version',
          help: 'Print the version',
          negatable: false,
        );
  try {
    final argResults = runner.argParser.parse(arguments);
    if (argResults['version'] == true) {
      Logs.i("Cue CLI version: ${CliInfo.version}");
      return;
    }
    await runner.run(arguments);
  } catch (e) {
    Logs.e("An error has occurred: $e");
  }
}
