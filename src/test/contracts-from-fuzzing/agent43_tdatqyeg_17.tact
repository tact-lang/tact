struct First {
    a: Int;
}

struct Second {
    b: Int;
}

struct Third {
    c: Int;
}

contract MultiStructs {
    f: First;
    s: Second;
    t: Third;

    init() {
        self.f = First{ a: 1 };
        self.s = Second{ b: 2 };
        self.t = Third{ c: 3 };
    }
}