struct Pair {
    a: Int;
    b: Int;
}

struct List5 {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;
    p5: Pair;
}

contract NestedPairs {
    container: List5;
    init() {
        self.container = List5{
            p1: Pair{a:1,b:2},
            p2: Pair{a:3,b:4},
            p3: Pair{a:5,b:6},
            p4: Pair{a:7,b:8},
            p5: Pair{a:9,b:10},
        };
    }
}