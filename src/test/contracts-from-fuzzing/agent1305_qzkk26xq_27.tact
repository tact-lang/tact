struct InlineDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool = false;
    d: Bool? = true;
    e: String = "x";
    f: String? = null;
}

contract TestContract {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}