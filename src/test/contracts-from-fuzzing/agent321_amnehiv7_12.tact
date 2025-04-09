struct Point {
  x: Int as int64;
  y: Int as int64;
}

struct Rectangle {
  topLeft: Point;
  botRight: Point;
}

contract SerializeFormats {
  rect: Rectangle;

  init() {
    self.rect = Rectangle{
      topLeft: Point{ x: 1, y: 2 },
      botRight: Point{ x: 3, y: 4 }
    };
  }
}