struct Pair {
    x: Int;
    y: Int;
}

struct NestedPair {
    p1: Pair;
    p2: Pair;
}

contract SymmetricPairs {
    val: NestedPair;

    init() {
        self.val = NestedPair{
            p1: Pair{ x: 1, y: 2 },
            p2: Pair{ x: 3, y: 4 }
        };
    }
}