# Common Xcode Error Messages

### Something about `errSecInternalComponent` 

Look at [this article](https://stackoverflow.com/questions/24023639/xcode-command-usr-bin-codesign-failed-with-exit-code-1-errsecinternalcomponen) on StackOverflow.

### Getting rid of CoreTelephony logs

```
xcrun simctl spawn booted log config --mode "level:off" --subsystem com.apple.CoreTelephony
```
