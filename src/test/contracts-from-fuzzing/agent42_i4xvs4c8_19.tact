struct InlineDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "str";
}

contract ContractInlineDef {
    val: InlineDefaults;

    init() {
        self.val = InlineDefaults{};
    }
}