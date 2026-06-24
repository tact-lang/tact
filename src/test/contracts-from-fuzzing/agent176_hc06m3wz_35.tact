contract CrossNullable {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "hello";
    d: Int = 42;
    e: Bool = false;
    f: String = "world";

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
        self.d = 100;
        self.e = true;
        self.f = "!";
    }
}