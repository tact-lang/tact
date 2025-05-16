struct Nested {
    a: Int;
    b: Bool;
}

contract TestContract {
    n: Nested;

    init() {
        self.n = Nested{a: 1, b: true};
    }
}
