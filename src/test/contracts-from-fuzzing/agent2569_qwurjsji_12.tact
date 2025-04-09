struct V2 { x: Int; y: Int; }
struct Rectangle { p1: V2; p2: V2; }
struct PairOfRects { r1: Rectangle; r2: Rectangle; }

contract DeepNested {
  val: PairOfRects = PairOfRects{
    r1: Rectangle{ p1: V2{ x: 0, y: 0 }, p2: V2{ x:1, y:1 } },
    r2: Rectangle{ p1: V2{ x:2, y:2 }, p2: V2{ x:3, y:3 } }
  };
}