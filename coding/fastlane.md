# Tips on using Fastlane

## Setup Versioning
I think this is what I just did to setup versioning and `bump_build_number` with the Apple Generic Versioning System. This [guide](https://developer.apple.com/library/archive/qa/qa1827/_index.html) really helps.

All the following happens inside `Build Settings`:
1. Set `Versioning System` to `Apple Generic`.
2. Set `Current Project Version` to the same as your current build number from the `Info.plist`.
3. Remove the `$(SRCROOT)` from the path to the Info Plist.

Then you can add the following inside your `Fastfile`:
```
desc "Increases the build number of the application."
lane :bump_build_number do
  increment_build_number(
    xcodeproj: "./PROJECT_NAME.xcodeproj"
  )
  commit_version_bump(
    xcodeproj: "./PROJECT_NAME.xcodeproj"
  )
end
```
