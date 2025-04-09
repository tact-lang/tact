contract OptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    init() {
        self.a = 7;
        self.b = true;
        self.c = "done";
    }

    receive() {
        self.a = null;
    }
}