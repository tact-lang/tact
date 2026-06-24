struct InlineDefaults {
    a: Int = 123;
    b: Bool = false;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract TestContract {
    d: InlineDefaults;

    init() {
        self.d = InlineDefaults{};
    }
}
