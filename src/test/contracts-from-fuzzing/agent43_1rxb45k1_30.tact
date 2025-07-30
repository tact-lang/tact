struct Point { x: Int; y: Int; }

contract Test {
  receive() {
    let p = Point{ x: 1, y: 2 };
    p.x = 10;
  }
}