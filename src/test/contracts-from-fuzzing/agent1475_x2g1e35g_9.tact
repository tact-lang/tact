struct InlineDefaults {
    a: Int = 5;
    b: Bool = false;
    s: String = "hello";
}

contract ContractWithDefaults {
    val: InlineDefaults;

    init() {
        self.val = InlineDefaults{};
    }
}