struct Pair {
    x: Int;
    y: Bool;
}

contract ListPairs {
    p1: Pair;
    p2: Pair;
    p3: Pair;

    init() {
        self.p1 = Pair{ x: 1, y: true };
        self.p2 = Pair{ x: 2, y: false };
        self.p3 = Pair{ x: 3, y: true };
    }
}