struct NestedOptional {
  innerOpt: Int?;
  strOpt: String?;
}

contract LargeWithOpt {
  i: Int;
  s: String;
  no: NestedOptional;

  init() {
    self.i = 8;
    self.s = "abc";
    self.no = NestedOptional{innerOpt: null, strOpt: null};
  }
}
