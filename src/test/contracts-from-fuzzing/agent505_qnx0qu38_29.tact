contract OnlyFields {
    a: Int = 1;
    b: Int? = null;
    c: Bool? = null;
    d: String = "z";

    init() {
        self.b = 9;
        self.c = true;
    }

    receive() {
        self.a = self.a + 1;
    }
}