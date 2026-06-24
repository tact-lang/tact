struct Pair {
    first: Int;
    second: Int;
}

contract ArrayLike {
    p1: Pair;
    p2: Pair;
    p3: Pair;

    init() {
        self.p1 = Pair{ first: 1, second: 2 };
        self.p2 = Pair{ first: 3, second: 4 };
        self.p3 = Pair{ first: 5, second: 6 };
    }
}