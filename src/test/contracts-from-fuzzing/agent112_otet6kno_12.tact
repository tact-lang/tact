contract MixedOptionals {
    a: Int?;
    b: Bool = true;
    c: String?;
    d: Int = 1;
    e: String = "str";
    f: Bool?;

    init() {
        self.a = 123;
        self.b = false;
        self.c = "hi";
        self.d = 5;
        self.e = "bye";
        self.f = true;
    }
}
