contract OptionalDefaults2 {
    a: Int? = null;
    b: String? = "hi";
    c: Bool? = false;

    init() {
        self.a = 5;
        self.b = null;
        self.c = true;
    }
}