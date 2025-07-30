struct S {
    a: Int;
    b: Int;
}

contract InitFieldOverride {
    data: S = S { a: 1, b: 2 };

    init() {
        self.data = S { a: 42, b: 100 };
    }
}