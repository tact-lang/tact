struct First {
    a: Int;
}

struct Second {
    b: Bool;
}

struct Third {
    c: String;
}

contract ThreeNest {
    f: First;
    s: Second;
    t: Third;

    init() {
        self.f = First{ a: 1 };
        self.s = Second{ b: true };
        self.t = Third{ c: "x" };
    }
}