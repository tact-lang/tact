struct Point {
  x: Int;
  y: Int;
}

struct Rectangle {
  topLeft: Point;
  bottomRight: Point;
}

contract StructOfStructs {
  r: Rectangle;

  init() {
    self.r = Rectangle{
      topLeft: Point{x:0,y:0},
      bottomRight: Point{x:100,y:100}
    };
  }
}