struct NestedStringy {
  s1: String;
  s2: String;
}

contract StringFields {
  main: String;
  nested: NestedStringy;
  flag: Bool;

  init() {
    self.main = "main";
    self.nested = NestedStringy{ s1: "hello", s2: "world" };
    self.flag = true;
  }
}