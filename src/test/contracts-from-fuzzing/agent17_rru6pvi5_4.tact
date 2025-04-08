struct Inner { val: Int; }
struct Middle { inner: Inner; }
struct Outer { middle: Middle; }

contract NestedOneField {
  chain: Outer;

  init() {
    self.chain = Outer{ middle: Middle{ inner: Inner{ val: 99 } } };
  }
}