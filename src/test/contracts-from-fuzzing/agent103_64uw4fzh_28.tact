contract DefaultVals {
    a: Int = 10;
    b: Bool = true;
    c: String = "Hello";
    d: Int?; // null implicit
    e: String?; // null implicit

    init() {
        self.a = 20;
        self.b = false;
        self.c = "World";
        self.d = null;
        self.e = null;
    }
}
