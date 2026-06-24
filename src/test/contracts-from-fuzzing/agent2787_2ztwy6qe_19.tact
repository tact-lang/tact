struct Point { x: Int; y: Int }
struct Circle { c: Point; r: Int }
struct Rect { a: Point; b: Point }

contract Mix {
  p: Point;
  c: Circle;
  r: Rect;
  origin: Point?;
  init() {
    self.p = Point{x:1,y:2};
    self.c = Circle{c: Point{x:0,y:0}, r: 5};
    self.r = Rect{ a: Point{x:-1,y:-1}, b: Point{x:1,y:1} };
    self.origin = null;
  }
}
