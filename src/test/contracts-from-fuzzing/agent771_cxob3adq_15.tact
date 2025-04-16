contract ManyOptionals {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int? = null;
    e: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = 42;
        self.e = "xyz";
    }
}