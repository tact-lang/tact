struct First {
    a: Int;
}

struct Second {
    b: Int;
}

contract AdjacentStructs {
    f: First;
    s: Second;

    init() {
        self.f = First{a: 1};
        self.s = Second{b: 2};
    }
}