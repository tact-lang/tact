struct InlineDefaults {
    a: Int = 10;
    b: Bool = true;
    c: Sub? = null;
}

struct Sub {
    d: Int = 99;
    e: Bool? = null;
}

contract TestContract {
    inlineField: InlineDefaults;

    init() {
        self.inlineField = InlineDefaults{};
    }
}
