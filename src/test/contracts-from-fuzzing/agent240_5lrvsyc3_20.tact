contract InitNullOptionals {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;

    init() {
        self.a = null;
        self.b = 10;
        self.c = null;
        self.d = true;
    }
}