struct Nested {
    inner: Int;
}

contract TestContract {
    data: Nested;

    init() {
        self.data = Nested{ inner: 5 };
    }
}