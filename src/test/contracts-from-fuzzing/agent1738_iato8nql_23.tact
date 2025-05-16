struct Tiny {
    x: Int;
}

contract TestContract {
    a: Tiny;
    b: Tiny;
    c: Tiny;
    d: Tiny;
    e: Tiny;
    f: Tiny;
    g: Tiny;
    h: Tiny;
    i: Tiny;
    j: Tiny;
    k: Tiny;

    init() {
        self.a = Tiny{ x: 1 };
        self.b = Tiny{ x: 2 };
        self.c = Tiny{ x: 3 };
        self.d = Tiny{ x: 4 };
        self.e = Tiny{ x: 5 };
        self.f = Tiny{ x: 6 };
        self.g = Tiny{ x: 7 };
        self.h = Tiny{ x: 8 };
        self.i = Tiny{ x: 9 };
        self.j = Tiny{ x: 10 };
        self.k = Tiny{ x: 11 };
    }
}