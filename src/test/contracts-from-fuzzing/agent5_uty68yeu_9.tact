contract DefaultOverride {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Bool = true;
    d: String = "hi";

    init() {
        self.a = 42;
        self.b = 7;
        self.c = false;
        self.d = "bye";
    }
}