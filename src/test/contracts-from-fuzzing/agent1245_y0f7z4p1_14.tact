struct SubStruct {
  foo: Int;
  bar: String;
}

contract DefaultsExample {
  s: SubStruct;
  optInt: Int?;
  optStr: String?;
  flag: Bool;

  init() {
    self.s = SubStruct { foo: 42, bar: "blah" };
    self.optInt = null;
    self.optStr = null;
    self.flag = false;
  }
}
