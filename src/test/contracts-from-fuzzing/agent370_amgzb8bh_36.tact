struct SA {
  a: Int;
}
struct SB {
  b: SA;
}
struct SC {
  c: SB;
}
contract ChainNested {
  v: SC;

  init() {
    self.v = SC{ c: SB{ b: SA{ a: 10 } } };
  }
}