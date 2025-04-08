message(0xAA) M {
    k: Int as uint32;
}

struct S {
    j: Int as uint32;
}

contract Combo {
    m: M;
    s: S;

    init() {
        self.m = M{ k:1 };
        self.s = S{ j:2 };
    }

    receive() {
        self.m = M{ k:10 };
        self.s = S{ j:20 };
    }
}