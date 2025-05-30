struct Inner {
  a: Int;
  b: Bool;
  c: Address;
}

contract NestedTest {
  s: Inner;

  init() {
    self.s = Inner{ a:1, b:true, c:myAddress() };
  }
}