contract FieldsWithDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;

    init() {
        self.a = 55;
        self.b = true;
        self.c = "zz";
        self.d = 42;
    }
}