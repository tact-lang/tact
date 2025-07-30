struct X {
    s: String = "x";
}

struct Holder {
    a: X;
    b: X;
    c: X;
    d: X;
    e: X;
}

contract TestContract {
    h: Holder;
    init() {
        self.h = Holder{
            a: X{ s: "1" },
            b: X{ s: "2" },
            c: X{ s: "3" },
            d: X{ s: "4" },
            e: X{ s: "5" }
        };
    }
    receive() {
        self.h.c.s = "changed";
    }
}