struct Nested {
    inner: Int?;
}

contract Test {
    item: Nested;
    init() {
        self.item = Nested{ inner: null };
    }
}