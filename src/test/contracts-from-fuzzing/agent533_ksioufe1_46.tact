struct Middle { x: Int; }
struct Outer { y: Middle; }

contract NullAssign {
  val: Outer?;
  init() {
    self.val = null;
  }
}