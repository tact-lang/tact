struct InlineBigDefault {
    f1: Int = 1;
    f2: Bool = false;
    f3: String = "abc";
}

contract InlineDefaults {
    s: InlineBigDefault;

    init() {
        self.s = InlineBigDefault{};
    }
}