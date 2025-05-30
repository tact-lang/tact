struct Pair {
    x: Int;
    y: Int;
}

contract ArrayLike {
    p1: Pair;
    p2: Pair;

    init() {
        self.p1 = Pair{ x:1,y:2 };
        self.p2 = Pair{ x:3,y:4 };
    }
}
