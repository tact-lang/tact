struct Point { x:Int; y:Int; }

contract Many {
  p1: Point;
  p2: Point;
  p3: Point;
  p4: Point;
  p5: Point;
  p6: Point;
  p7: Point;
  p8: Point;
  p9: Point;
  p10: Point;

  init() {
    self.p1 = Point{ x: 1, y: 2 };
    self.p2 = Point{ x: 3, y: 4 };
    self.p3 = Point{ x: 5, y: 6 };
    self.p4 = Point{ x: 7, y: 8 };
    self.p5 = Point{ x: 9, y: 10 };
    self.p6 = Point{ x: 11, y: 12 };
    self.p7 = Point{ x: 13, y: 14 };
    self.p8 = Point{ x: 15, y: 16 };
    self.p9 = Point{ x: 17, y: 18 };
    self.p10 = Point{ x: 19, y: 20 };
  }
}