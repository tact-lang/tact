// nested contract fields initialized partially; some omitted defaults
struct Inside {
  a: Int = 5;
  b: Bool = false;
}

contract PartialDefaults {
  s: Inside;

  init() {
    self.s = Inside{};
  }
}