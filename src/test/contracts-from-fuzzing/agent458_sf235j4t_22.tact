struct SStr {
  a: String = "a";
  b: String?;
}

contract StructOptionalStr {
  s: SStr;

  init() {
    self.s = SStr{
      a: "new",
      b: null
    };
  }
}