struct InnerDefault {
    x: Int = 7;
    y: Bool = false;
}

contract ContractWithDefaults {
    nested: InnerDefault;

    init() {
        self.nested = InnerDefault{};
    }
}