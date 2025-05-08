struct Nested {
    inside: String = "inside";
    flag: Bool = false;
}

contract TestContract {
    nested: Nested = Nested{};

    init() {
        self.nested = Nested{};
    }
}