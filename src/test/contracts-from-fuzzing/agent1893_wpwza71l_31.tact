struct First {
    v1: Int;
}

struct Second {
    v2: Int;
}

contract TupleLike {
    a: First;
    b: Second;
    c: Int;

    init() {
        self.a = First{ v1: 1 };
        self.b = Second{ v2: 2 };
        self.c = 3;
    }
}