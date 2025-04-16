struct Nested {
    id: Int;
}

contract MultiNested {
    a: Nested;
    b: Nested;
    c: Nested;

    init() {
        self.a = Nested{ id: 1 };
        self.b = Nested{ id: 2 };
        self.c = Nested{ id: 3 };
    }
}