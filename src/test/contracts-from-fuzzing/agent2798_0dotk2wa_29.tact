struct InlineDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "default";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract DefaultsContract {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{};
    }
}