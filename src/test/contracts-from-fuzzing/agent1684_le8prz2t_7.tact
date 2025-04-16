struct InlineDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
}

contract DefaultsContract {
    s: InlineDefaults = InlineDefaults{};

    init() {
        self.s = InlineDefaults{a: 42, b: true, c: "world"};
    }
}