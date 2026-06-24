struct DefaultOptionals {
  a: Int? = null;
  b: Bool? = null;
  c: String? = null;
}

contract Test {
  opts: DefaultOptionals;
  init() { self.opts = DefaultOptionals{}; }
}