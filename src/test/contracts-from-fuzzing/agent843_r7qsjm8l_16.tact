struct Pair {
    x: Int;
    y: Int;
}

struct MultiPair {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;
}

contract NestedPairs {
    pairs: MultiPair;

    init() {
        self.pairs = MultiPair{
            p1: Pair{x:1,y:2},
            p2: Pair{x:3,y:4},
            p3: Pair{x:5,y:6},
            p4: Pair{x:7,y:8}
        };
    }
}