struct ComplexInitOrdering {
    a: Int = 5;
    b: Int?;
    c: Int = 10;
    d: Int?;
    e: Int = 15;
}

contract ComplexInitDefaults {
    data: ComplexInitOrdering;

    init() {
        self.data = ComplexInitOrdering{};
    }
}