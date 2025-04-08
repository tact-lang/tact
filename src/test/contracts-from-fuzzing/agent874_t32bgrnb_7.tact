struct Point {
  x: Int;
  y: Int;
}

struct MaybePoint {
  p: Point?;
}

contract OptionalInner {
  data: MaybePoint;
  init() {
    self.data = MaybePoint{
      p: null
    };
  }
}