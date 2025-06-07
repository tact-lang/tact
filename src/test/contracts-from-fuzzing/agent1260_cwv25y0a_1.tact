struct Nested {
    innerInt: Int = 42;
    innerBool: Bool = true;
}

contract TestContract {
    nested: Nested = Nested{};

    init() {
        self.nested = Nested{ innerInt: 100, innerBool: false };
    }
}