struct SWithDefaults {
    a: Int = 0;
    b: String = "";
    c: Bool = false;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract DefaultsContract {
    s: SWithDefaults;

    init() {
        self.s = SWithDefaults{};
    }
}