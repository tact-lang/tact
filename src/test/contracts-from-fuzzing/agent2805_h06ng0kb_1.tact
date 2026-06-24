struct Nested {
    inner: Int;
}

contract SimpleStorage {
    data: Nested;

    init() {
        self.data = Nested{inner: 42};
    }
}