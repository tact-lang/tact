struct Inn { x: Int; y: Int?; }
struct Mid { inn: Inn; z: Bool = false; }

contract InitNested {
  mid: Mid;
  init() {
    self.mid = Mid{ inn: Inn{ x: 1, y: null }, z: true };
  }
}