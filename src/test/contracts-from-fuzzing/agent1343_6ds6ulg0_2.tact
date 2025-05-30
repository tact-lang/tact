struct Nested {
    innerVal: Int = 42;
    optBool: Bool?;
}

contract ContainNested {
    field: Nested;

    init() {
        self.field = Nested{};
    }
}
