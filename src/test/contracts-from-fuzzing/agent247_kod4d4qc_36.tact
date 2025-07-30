struct Pair {
    a: Int;
    b: Int;
}
struct Wrapper {
    p1: Pair;
    p2: Pair;
}

contract ManyPairs {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            p1: Pair{a:1,b:2},
            p2: Pair{a:3,b:4}
        };
    }
}