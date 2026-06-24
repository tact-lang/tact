struct OptionalStrings {
  a: String?;
  b: String?;
  c: String?;
}

contract TestContract {
  opts: OptionalStrings;

  init() {
    self.opts = OptionalStrings{
      a:null,
      b:null,
      c:null
    };
  }
}