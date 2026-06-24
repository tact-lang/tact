struct ManyOptionals {
  a: Int?;
  b: Int?;
  c: Bool?;
  d: Bool?;
  e: String?;
  f: String?;
}

contract Test {
  opt: ManyOptionals;

  init() {
    self.opt = ManyOptionals{
      a: null,
      b: 2,
      c: null,
      d: false,
      e: "",
      f: null
    };
  }
}