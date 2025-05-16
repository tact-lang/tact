struct InnerMost { x: Int; }
struct Middle { inner: InnerMost; }
struct Outer { mid: Middle; }

contract NoDefaultsNested {
  val: Outer;

  init() {
    self.val = Outer{ mid: Middle{ inner: InnerMost{ x: 555 } } };
  }
}