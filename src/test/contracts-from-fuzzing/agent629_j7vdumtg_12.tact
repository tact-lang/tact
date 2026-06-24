struct One {
    a: Int;
}

struct Two {
    b: String;
}

struct Three {
    c: Bool;
}

contract MultiStructVars {
    f1: One;
    f2: Two;
    f3: Three;

    init() {
        self.f1 = One{ a: 10 };
        self.f2 = Two{ b: "str" };
        self.f3 = Three{ c: true };
    }
}