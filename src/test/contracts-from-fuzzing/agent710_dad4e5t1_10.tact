contract MultiFieldContract {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.c = "hello";
        self.d = 3;
        self.e = false;
        self.f = "optional";
    }
}