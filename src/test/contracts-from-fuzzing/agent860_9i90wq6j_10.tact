contract MixedTypes {
    a: Int = 0;
    b: Bool = false;
    c: String = "test";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = 2;
        self.e = false;
        self.f = "world";
    }
}