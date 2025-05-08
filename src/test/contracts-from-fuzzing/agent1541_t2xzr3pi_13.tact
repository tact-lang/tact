contract OptionalDefaults {
    a: Int?;
    b: Int? = 1;
    c: Bool?;
    d: Bool? = false;
    e: String? = "abc";

    init() {
        self.a = null;
        self.c = true;
    }

    receive() {
        if (self.b != null) {
            self.b = self.b!! + 1;
        }
    }
}