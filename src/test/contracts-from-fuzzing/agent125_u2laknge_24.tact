// explicit default null for many optional persistent fields
contract NullDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "yes";
        self.d = null;
    }
}