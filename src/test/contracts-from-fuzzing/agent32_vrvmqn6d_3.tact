struct DefaultOptional {
  a: Int?;
  b: String?;
}

contract Test {
  val: DefaultOptional;
  init() {
    self.val = DefaultOptional{a: null, b: null};
  }
}