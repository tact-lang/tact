struct Point {
  x: Int;
  y: Int;
}

contract OptionalStructField {
  pos: Point?;

  init() {
    self.pos = null;
  }
}