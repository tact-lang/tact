struct Nested {
    inner: Int;
}

contract TestContract {
    value: Nested;

    init() {
        self.value = Nested{ inner: 5 };
    }
}