struct Nested {
    innerVal: Int = 7;
    optionalVal: Bool?;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{};
    }
}