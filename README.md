## CI/CD with GitHub Actions

### Continuous Integration
This repository serves as a demonstration of continuous integration and continuous deployment (CI/CD) using GitHub
Actions. The CI/CD pipeline includes three essential jobs - `analyze`, `format`, and `test`.
Additionally, it showcases
the usage of Dart scripts to run various utility tasks within the pipeline.

The configuration of all the named tasks is defined in the `./.github/check.yaml` file. The Flutter sdk is installed
with `kuhnroyal/flutter-fvm-config-action@v1` which installs the correct flutter version that was configured via `fvm`.
Make sure to check out [this fvm guide](https://github.com/tapped-education/fvm_versioning).

This action also installs a dart sdk which gives you the ability to run dart scripts in your pipeline. This can be
useful for generating version strings, running custom assertions on files or any other task that might be too tedious in
a bash script.


### Continuous Delivery

The CD process is very tightly couple to the tools that you choose to use for building and deploying your apps.
The Flutter ecosystem has some tools that can help you with this process. For example, [Codemagic](https://codemagic.io/start/).
If you want to build and sign your apps in the pipeline and have more control over the build process tools like `fastlane` can be very helpful. Installing profiles and certificates can be done using [fastlane match](https://docs.fastlane.tools/actions/match/).
