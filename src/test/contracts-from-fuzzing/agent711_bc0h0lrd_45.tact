contract WeirdOrder {
    a: Int as uint4;
    b: Bool;
    c: Int?;
    d: Int = 1;

    init() {
        self.a = 2;
        self.b = true;
        self.c = 3;
    }
}
