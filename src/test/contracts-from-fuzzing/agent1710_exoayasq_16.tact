struct Pair {
    x: Int;
    y: Int;
}

contract Test {
    pair1: Pair;
    pair2: Pair;

    init() {
        self.pair1 = Pair{ x: 0, y: 1 };
        self.pair2 = Pair{ x: 2, y: 3 };
    }
}