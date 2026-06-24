struct Options {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
  d: Address? = null;
  e: Cell? = null;
}

contract LotsOfOptionals {
  opts: Options;

  init() {
    self.opts = Options{};
  }
}
