contract DefaultValuesEverywhere {
    a: Int = 0;
    b: Int = 1;
    c: Bool = true;
    d: Bool = false;
    e: String = "hello";
    f: String = "world";

    init() {
        self.a = 10;
        self.b = 20;
        self.c = false;
        self.d = true;
        self.e = "hi";
        self.f = "planet";
    }
}
