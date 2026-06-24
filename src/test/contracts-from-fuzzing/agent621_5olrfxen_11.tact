struct Point { x: Int; y: Int; }

struct Pair {
    p1: Point;
    p2: Point;
}

contract StructArraySim {
    data: Pair;
    init() {
        self.data = Pair{
            p1: Point{ x: 1, y: 2 },
            p2: Point{ x: 3, y: 4 }
        };
    }
}