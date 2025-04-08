struct Pair {
    left: Int;
    right: Int;
}

contract PairTest {
    first: Pair;
    second: Pair;

    init() {
        self.first = Pair{ left:1, right:2 };
        self.second = Pair{ left:3, right:4 };
    }
}