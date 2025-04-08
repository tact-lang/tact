struct Pair {
    left: Int;
    right: Int;
}

contract PairArray {
    p1: Pair;
    p2: Pair;
    p3: Pair;

    init() {
        self.p1 = Pair{left:1, right:2};
        self.p2 = Pair{left:3, right:4};
        self.p3 = Pair{left:5, right:6};
    }
}