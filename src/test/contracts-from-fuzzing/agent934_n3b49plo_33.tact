struct Coord { x: Int as int64; y: Int as int64 }
struct Rect { tl: Coord; br: Coord }
contract ShapeHolder {
  rect: Rect;
  init() {
    self.rect = Rect{
      tl: Coord{x:0,y:0},
      br: Coord{x:10,y:10}
    };
  }
}