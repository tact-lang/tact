struct S1 {
  s: String;
}

struct S2 {
  n: Int;
}

struct Comb {
  s1: S1;
  s2: S2;
  f: Bool;
}

contract Test {
  val: Comb;
  init() {
    self.val = Comb{
      s1: S1{s:"abc"},
      s2: S2{n:42},
      f: true
    };
  }
}