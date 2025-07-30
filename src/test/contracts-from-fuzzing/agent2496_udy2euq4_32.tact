contract ManyDefaultsOptionals {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.s = "test";
    }
}