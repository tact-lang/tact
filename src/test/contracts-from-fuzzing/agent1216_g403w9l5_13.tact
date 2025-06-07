struct Points {
  x: Int;
  y: Int;
}

struct Shape {
  start: Points;
  end: Points;
  name: String;
}

contract GeometryTest {
  shape: Shape;

  init() {
    self.shape = Shape{
      start: Points{ x:0, y:0 },
      end: Points{ x:10, y:10 },
      name: "Diagonal",
    };
  }
}