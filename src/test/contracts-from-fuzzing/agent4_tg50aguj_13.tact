struct Point {
  x: Int;
  y: Int;
}

fun makePoint(a: Int, b: Int): Point {
  return Point { x: a, y: b };
}

contract Test {
  receive() {
    let p = makePoint(1, 2);
  }
}