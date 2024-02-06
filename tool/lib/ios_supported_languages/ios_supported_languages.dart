import 'dart:io' as io;
import 'package:collection/collection.dart';
import 'package:xml/xml.dart';

void main(List<String> arguments) async {
  final supportedSourceFiles = {"de", "en", "fr", "nl"};

  final supportedIosLanguages = _findIosSupportedLanguages();

  final missingSupportedLanguages = supportedSourceFiles.difference(supportedIosLanguages);

  final missingSourceFiles = supportedIosLanguages.difference(supportedSourceFiles);

  if (missingSupportedLanguages.isNotEmpty) {
    throw Exception(
      "The following languages are not supported from the info.plist: ${missingSupportedLanguages.join(", ")}",
    );
  }

  if (missingSourceFiles.isNotEmpty) {
    throw Exception(
      "The following languages are not supported from the asset files: ${missingSourceFiles.join(", ")}",
    );
  }
}

// get the supported values from the info.plist file
Set<String> _findIosSupportedLanguages() {
  final infoPlistFile = io.File("${io.Directory.current.projectPath}/ios/Runner/Info.plist");

  final document = XmlDocument.parse(infoPlistFile.readAsStringSync());

  final supportedIosLanguages = document
      .findAllElements("key")
      .firstWhere((line) => line.innerText == "CFBundleLocalizations")
      .nextElementSibling!
      .children
      .whereType<XmlElement>()
      .toList()
      .map((e) => e.children.first.value)
      .toList();

  return supportedIosLanguages.whereNotNull().toSet();
}

extension DirectoryExtension on io.Directory {
  String get projectPath {
    const projectName = "continuous_ops";
    final currentPath = io.Directory.current.path;

    final indexOfProject = currentPath.lastIndexOf(projectName);

    if (indexOfProject == -1) {
      throw Exception(
        "Project path not found. Make sure the folder of the repository is named $projectName",
      );
    }

    final projectPath = currentPath.substring(0, indexOfProject + projectName.length);

    return projectPath;
  }
}
