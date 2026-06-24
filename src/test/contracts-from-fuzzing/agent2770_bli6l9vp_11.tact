struct WithBool {
  f: Bool;
}

struct WithInt {
  g: Int;
}

contract DiffStructs {
  s1: WithBool;
  s2: WithInt;

  init() {
    self.s1 = WithBool{ f: false };
    self.s2 = WithInt{ g: 7 };
  }
}