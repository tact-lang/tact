// Persistent state variables with explicit Optionals and defaults
contract OptionalDefaults {
    a: Int? = null;
    b: String? = null;
    c: Address? = null;
    d: Bool? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}