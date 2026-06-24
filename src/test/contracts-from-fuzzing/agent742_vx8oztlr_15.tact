struct Nested {
    a: Int;
    b: String?;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested { a: 123, b: null };
    }
}