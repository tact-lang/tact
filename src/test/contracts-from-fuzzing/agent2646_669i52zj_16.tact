struct InlineDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "abc";
}

contract InlineDefaultAssign {
    f: InlineDefaults;
    init() {
        self.f = InlineDefaults{};
    }
    receive() {}
}