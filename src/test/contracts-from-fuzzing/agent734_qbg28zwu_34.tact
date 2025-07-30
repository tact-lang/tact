struct ManyOptionals {
  a: Int? = null;
  b: Int? = null;
  c: Bool? = null;
  d: Bool? = null;
  e: String? = null;
  f: String? = null;
}

contract TestContract {
  data: ManyOptionals;

  init() {
    self.data = ManyOptionals{};
  }
}