contract TestContract {
  _aVeryLongFieldNameToTestNameManglingAndLimits: Int;
  _anotherLongFieldNameToTestFieldParsingOnPersistentStorageVariables: String;

  init() {
    self._aVeryLongFieldNameToTestNameManglingAndLimits = 123;
    self._anotherLongFieldNameToTestFieldParsingOnPersistentStorageVariables = "ok";
  }
}