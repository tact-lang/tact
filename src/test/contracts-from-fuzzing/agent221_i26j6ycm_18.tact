struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract OptionalDefaultsContract {
    s: OptionalWithDefaults;
    init() {
        self.s = OptionalWithDefaults{ a: null, b: false, c: null };
    }
}