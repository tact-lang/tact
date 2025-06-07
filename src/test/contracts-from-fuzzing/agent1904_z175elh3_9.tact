struct P1 {
    a: Int;
    b: Bool;
}

struct P2 {
    c: P1;
    d: Int;
}

contract Test {
    p2field: P2;

    init() {
        self.p2field = P2{
            c: P1{
                a: 7,
                b: false,
            },
            d: 42,
        };
    }
}