struct Nested {
  x: Int;
  s: String;
}

contract PersistentSeparates {
  s1: Nested;
  s2: Nested;
  optI: Int?;
  optS: String?;

  init() {
    self.s1 = Nested{ x: 1, s: "hi" };
    self.s2 = Nested{ x: 2, s: "hello" };
    self.optI = null;
    self.optS = null;
  }
}