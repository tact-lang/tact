struct S1 {
  i: Int;
}

struct S2 {
  j: Int;
}

struct Both {
  s1: S1?;
  s2: S2?;
}

contract OptionalStructs {
  value: Both;
  init() {
    self.value = Both{
      s1: S1{i:1},
      s2: null
    };
  }
}