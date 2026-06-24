// contract with many optional and defaulted fields in various types
contract OptionalAndDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = true;
    d: Address? = null;
    e: Int? = 42;
    f: String? = "ok";
    g: Bool = false;
    h: Int = 5;

    init() {
        self.a = null;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = 42;
        self.f = "ok";
        self.g = false;
        self.h = 5;
    }
}