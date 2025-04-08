struct Pair {
    a: Int;
    b: Int;
}

contract SameStructTwice {
    p1: Pair;
    p2: Pair;

    init() {
        self.p1 = Pair{ a: 10, b: 20 };
        self.p2 = Pair{ a: 30, b: 40 };
    }
}
