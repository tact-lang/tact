struct InlineDefaults {
    counter: Int = 10;
    message: String = "hello";
    flag: Bool = true;
}

contract StructInlineDefaults {
    val: InlineDefaults;

    init() {
        self.val = InlineDefaults{};
    }
}