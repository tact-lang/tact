struct Nested { inner: Int; }

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ inner: 1 };
    }
}