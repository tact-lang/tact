struct Pair {
    x: Int;
    y: Bool;
}

struct Quad {
    p1: Pair;
    p2: Pair;
}

contract NestedPairs {
    q: Quad;

    init() {
        self.q = Quad{
            p1: Pair{x: 1, y: true},
            p2: Pair{x: 2, y: false}
        };
    }

    receive() {}
}