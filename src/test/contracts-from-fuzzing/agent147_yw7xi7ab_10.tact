struct S { x: Int = 1; y: Bool = true; z: String = "ok"; }

contract Multi {
  s1: S;
  s2: S;

  init() {
    self.s1 = S{};
    self.s2 = S{};
  }
}