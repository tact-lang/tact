struct Point {
  x: Int;
  y: Int;
}

struct Box {
  p1: Point;
  p2: Point;
  p3: Point;
  p4: Point;
}

contract DeeplyNested {
  box: Box;

  init() {
    self.box = Box{
      p1: Point{ x: 1, y: 2 },
      p2: Point{ x: 3, y: 4 },
      p3: Point{ x: 5, y: 6 },
      p4: Point{ x: 7, y: 8 },
    };
  }
}