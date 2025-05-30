struct Pair { x: Int; y: Int; }
struct Quad { p1: Pair; p2: Pair; }

contract TupleLike {
    t: Quad;

    init() {
        self.t = Quad{
            p1: Pair{ x:1, y:2 },
            p2: Pair{ x:3, y:4 }
        };
    }
}