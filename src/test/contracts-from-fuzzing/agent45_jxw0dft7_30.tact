struct Point {
  x: Int;
  y: Int;
}

contract TestContract {
  receive() {
    let p: Point = Point {
      x: 1,
      y: 2
    };
  }
}