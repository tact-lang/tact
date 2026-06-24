struct InnerMost { x: Int }
struct Middle { inner: InnerMost }
struct Outer { mid: Middle }

contract Test {
  s: Outer;

  init() {
    self.s = Outer{ mid: Middle{ inner: InnerMost{ x:42 } } };
  }
}