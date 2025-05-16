contract OptionalsDirect {
    a: Int? = null;
    b: Bool? = null;
    c: Int? = 2;

    receive() {
        self.a = 1;
        self.b = true;
        self.c = null;
    }
}