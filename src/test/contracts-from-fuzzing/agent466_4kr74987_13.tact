struct Pair { x: Int; y: Int; }

contract ArrayLike {
    p1: Pair;
    p2: Pair;
    p3: Pair;
    p4: Pair;

    init() {
        self.p1 = Pair{x:1,y:1};
        self.p2 = Pair{x:2,y:2};
        self.p3 = Pair{x:3,y:3};
        self.p4 = Pair{x:4,y:4};
    }
}