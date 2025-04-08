struct Nested {
    foo: Int;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{ foo: 123 };
    }
}