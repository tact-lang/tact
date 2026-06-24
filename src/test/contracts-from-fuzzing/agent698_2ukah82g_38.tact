struct Pair {
    left: Int;
    right: Int;
}

struct PairOpt {
    left: Int?;
    right: Int?;
}

contract TestContract {
    a: Pair;
    b: PairOpt;

    init() {
        self.a = Pair{ left: 1, right: 2 };
        self.b = PairOpt{ left: null, right: 3 };
    }
}