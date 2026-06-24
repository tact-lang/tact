struct Nested {
    inner: Int;
}

contract MinimalStorage {
    data: Nested;

    init() {
        self.data = Nested{inner: 7};
    }
}