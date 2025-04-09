struct Pair {
    a: Int;
    b: Int;
}

contract ManyPairs {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    init() {
        self.p1 = Pair{a:1,b:2};
        self.p2 = Pair{a:3,b:4};
        self.p3 = Pair{a:5,b:6};
    }
}