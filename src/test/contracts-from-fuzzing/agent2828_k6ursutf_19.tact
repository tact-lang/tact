struct Pos { x: Int; y: Int; }

struct DoublePos { p1: Pos; p2: Pos; }

contract StructTwice {
    d: DoublePos;

    init() {
        self.d = DoublePos{ p1: Pos{ x:1, y:2 }, p2: Pos{ x:3, y:4 } };
    }
}