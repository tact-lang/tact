struct Pair {
    col1: Int;
    col2: Int;
}

contract ArrayLike {
    p1: Pair;
    p2: Pair;
    p3: Pair;

    init() {
        self.p1 = Pair{col1:1,col2:2};
        self.p2 = Pair{col1:3,col2:4};
        self.p3 = Pair{col1:5,col2:6};
    }
}