struct InnerMost { x: Int = 99; }
struct Middle { inner: InnerMost = InnerMost{}; }
struct Outer { mid: Middle = Middle{}; }

contract NestedDefaults {
  val: Outer;

  init() {
    self.val = Outer{};
  }
}