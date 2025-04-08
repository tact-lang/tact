struct InnerStructDefaults {
    a: Int = 5;
    b: Bool = true;
}

contract ContractWithInlineInnerDefault {
    inner: InnerStructDefaults = InnerStructDefaults{};

    init() {
        self.inner = InnerStructDefaults{};
    }
}