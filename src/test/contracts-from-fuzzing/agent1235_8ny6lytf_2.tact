struct Nested {
    x: Int;
    y: Int?;
}

contract StoreNested {
    n: Nested;

    init() {
        self.n = Nested{ x: 1, y: null };
    }
}