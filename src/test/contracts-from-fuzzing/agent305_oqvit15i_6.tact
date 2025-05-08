struct StrA {
  a1: Int;
  a2: String;
}

struct StrB {
  b1: Bool;
  b2: StrA;
}

struct StrC {
  c1: Int;
  c2: StrB;
}

contract DeepCombine {
  state: StrC;

  init() {
    self.state = StrC{
      c1: 5,
      c2: StrB{
        b1: false,
        b2: StrA{ a1: 6, a2: "hi" },
      },
    };
  }
}