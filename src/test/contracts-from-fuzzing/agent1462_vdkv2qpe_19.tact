struct InlineDefaults {
    a: Int = 5;
    b: Bool = false;
    s: String = "hello";
}

contract ContractWithStructDefaults {
    f: InlineDefaults;

    init() {
        self.f = InlineDefaults{};
    }
}