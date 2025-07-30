struct BoolOptWithTrueDefault {
    b: Bool? = true;
}

contract BoolOptTrueContract {
    foo: BoolOptWithTrueDefault;
    init() {
        self.foo = BoolOptWithTrueDefault{};
    }
}