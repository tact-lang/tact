struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
}

struct Both {
    s1: S1; s2: S2;
}

contract TwoStructs {
    field: Both;

    init() {
      self.field = Both{
        s1: S1{ x: 1 },
        s2: S2{ y: 2 }
      };
    }
}