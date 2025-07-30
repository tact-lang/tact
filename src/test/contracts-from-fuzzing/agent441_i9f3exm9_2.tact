struct Nested {
    inner: Int;
    flag: Bool;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ inner: 10, flag: true };
    }
}
