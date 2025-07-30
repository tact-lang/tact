// contract param with nested structs with defaults
struct XY { x: Int=1; y: Int=2; }

contract TestWrap(
  val: XY
) {
  receive() { let _ = self.val.x + self.val.y; }
}