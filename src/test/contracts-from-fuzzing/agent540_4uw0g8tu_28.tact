struct Pair {
    left: Int;
    right: Int;
}

struct Quad {
    p1: Pair;
    p2: Pair;
}

contract DoublePairs {
    quad: Quad;

    init() {
        self.quad = Quad{
            p1: Pair{ left: 1, right: 2 },
            p2: Pair{ left: 3, right: 4 }
        };
    }
}