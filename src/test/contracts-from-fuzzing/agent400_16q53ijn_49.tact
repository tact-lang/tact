message(101) M1 { a: Int; }
message(102) M2 { b: Bool; }

struct MWrap {
  m1: M1?;
  m2: M2?;
}

contract OptionalMsgs {
  val: MWrap = MWrap { m1: null, m2: null };
  init() {}
}