struct Tiny {
    b1: Bool;
}

struct Tinier {
    t: Tiny;
}

contract Test19 {
    v: Tinier;

    init() {
        self.v = Tinier{
            t: Tiny{ b1: true },
        };
    }

    receive() {}
}