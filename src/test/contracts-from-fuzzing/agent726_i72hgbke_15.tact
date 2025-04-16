contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }

    receive() {
        self.a = 42;
        self.b = true;
        self.c = "hello";
    }
}