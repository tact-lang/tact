struct Pair {
    x: Int;
    y: Int;
}

struct ManyPairs {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;
    p5: Pair;
    p6: Pair;
    p7: Pair;
    p8: Pair;
    p9: Pair;
    p10: Pair;
}

contract LotsOfStructFields {
    data: ManyPairs;

    init() {
        self.data = ManyPairs{
            p1: Pair{ x:1,y:1},
            p2: Pair{ x:2,y:2},
            p3: Pair{ x:3,y:3},
            p4: Pair{ x:4,y:4},
            p5: Pair{ x:5,y:5},
            p6: Pair{ x:6,y:6},
            p7: Pair{ x:7,y:7},
            p8: Pair{ x:8,y:8},
            p9: Pair{ x:9,y:9},
            p10:Pair{ x:10,y:10}
        };
    }
}