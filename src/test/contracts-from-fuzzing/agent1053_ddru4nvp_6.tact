struct S {
  a: Int;
  b: Bool;
}

contract MixedTopOptional {
  maybeStruct: S?;
  maybeNum: Int?;
  flag: Bool;

  init() {
    self.maybeStruct = null;
    self.maybeNum = 42;
    self.flag = true;
  }
}