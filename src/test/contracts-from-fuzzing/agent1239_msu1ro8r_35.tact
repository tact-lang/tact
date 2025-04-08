struct InnerX {
  val: Int;
}

struct MiddleX {
  inx: InnerX;
}

contract NullableMiddle {
  m: MiddleX?;

  init() {
    self.m = null;
  }
}