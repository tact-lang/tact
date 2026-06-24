struct RecA { x: Int; }
struct RecB { xa: RecA; }
struct RecC { xb: RecB; }

contract RecursionEdge {
  s: RecC;
  init() {
    self.s = RecC{xb: RecB{xa: RecA{x: 1}}};
  }
}