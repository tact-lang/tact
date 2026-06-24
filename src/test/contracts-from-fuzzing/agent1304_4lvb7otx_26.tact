message(5) MsgInner { v: Int }

struct S1 {
  foo: Int?;
  m: MsgInner?;
}

struct S2 {
  inner: S1?;
}

contract OptNestMix {
  s2: S2?;

  init() {
    self.s2 = null;
  }
}