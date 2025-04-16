struct Nested {
    value: Int;
}

contract TestContract {
    single: Nested;

    init() {
        self.single = Nested{ value: 42 };
    }
}