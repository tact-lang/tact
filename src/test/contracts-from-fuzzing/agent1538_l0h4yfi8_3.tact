struct NestedOptional {
  num: Int?;
  flag: Bool?;
  text: String?;
}

contract Test {
  opt: NestedOptional?;
  active: Bool;

  init() {
    self.opt = NestedOptional{
      num: 5,
      flag: null,
      text: "abc"
    };
    self.active = true;
  }
}