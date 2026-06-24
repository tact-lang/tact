struct Nested {
    innerValue: Int = 42;
    flag: Bool = true;
    optionalText: String?;
}

contract Test {
    nested: Nested = Nested{};
    init() {
        self.nested = Nested{
            innerValue: 100,
            flag: false,
            optionalText: "test"
        };
    }
}