contract MultipleOptionals {
    a: Int? = null;
    b: String? = null;
    c: Bool? = true;
    d: String? = "text";
    e: Int? = 42;

    init() {
        self.a = null;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = 0;
    }
}