struct P1 {
    a: Int;
}

struct P2 {
    a: Int;
}

struct Wrapper {
    p1: P1;
    p2: P2;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            p1: P1{a: 1},
            p2: P2{a: 2}
        };
    }
}