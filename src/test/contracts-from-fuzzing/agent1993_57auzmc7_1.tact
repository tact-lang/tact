struct Nested {
    value: Int;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{ value: 5 };
    }
}