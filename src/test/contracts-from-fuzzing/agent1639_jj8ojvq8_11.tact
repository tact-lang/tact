struct Param {
  a: Int;
  b: Bool?;
  c: String;
}

contract OptionalStructField {
  opt: Param?;

  init() {
    self.opt = Param{
      a: 2,
      b: null,
      c: "qqq",
    };
  }
}
