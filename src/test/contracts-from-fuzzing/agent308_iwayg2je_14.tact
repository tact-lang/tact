struct S {
  a: Int? = null;
  b: Bool? = null;
  c: Address? = null;
  d: String? = null;
}

contract DefaultsOptional {
  s: S;

  init() {
    self.s = S{};
  }
}