struct First {
    a: Int;
}

struct Second {
    b: Bool;
}

contract TwoStructs {
    f: First;
    s: Second;

    init() {
        self.f = First{ a: 8 };
        self.s = Second{ b: false };
    }
}
