contract MixedTypes {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 2;
        self.b = true;
        self.c = "hello";
        self.d = null;
        self.e = false;
        self.f = null;
    }
}