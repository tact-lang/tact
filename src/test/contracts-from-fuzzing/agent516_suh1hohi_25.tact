struct First {
    a: Int;
}

struct Second {
    b: Int?;
}

contract DiffOptionals {
    f: First;
    s: Second;

    init() {
        self.f = First{ a: 42 };
        self.s = Second{ b: null };
    }
}
