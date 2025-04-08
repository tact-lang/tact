struct OuterS {
  a: Int;
  b: InnerS;
}
struct InnerS {
  c: Int;
}

contract TestSerialization {
  val: OuterS;
  init() {
    self.val = OuterS{ a: 3, b: InnerS{ c: 4 } };
  }
}