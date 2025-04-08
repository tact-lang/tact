struct InlineDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "t";
}

contract UsesDefaults {
    f: InlineDefaults;

    init() {
        self.f = InlineDefaults{};
    }
}