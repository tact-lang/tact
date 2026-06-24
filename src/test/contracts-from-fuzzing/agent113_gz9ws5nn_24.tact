struct S1 { a: Int }
struct S2 { b: Int }
struct Holder {
  s1: S1;
  s2: S2;
}

contract NestedStructs {
  val: Holder;

  init() {
    self.val = Holder{
      s1: S1{a:1},
      s2: S2{b:2}
    };
  }
}