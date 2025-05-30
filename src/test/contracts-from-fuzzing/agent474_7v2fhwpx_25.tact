struct Point { x: Int; y: Int }

struct Line {
  start: Point;
  end: Point;
}

struct Shape {
  edge: Line;
  name: String;
}

contract Test {
  polygon: Shape;

  init() {
    self.polygon = Shape{
      edge: Line{
        start: Point{ x:1, y:2 },
        end: Point{ x:3, y:4 }
      },
      name: "segment"
    };
  }
}
