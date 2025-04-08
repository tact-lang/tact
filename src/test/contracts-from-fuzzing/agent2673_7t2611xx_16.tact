contract OptionalAssignDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    s: String? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.s = null;
    }
}