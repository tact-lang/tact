contract OptionalOrder {
    a: Int?;
    b: Int;
    c: Int?;

    init() {
        self.a = null;
        self.b = 0;
        self.c = null;
    }
}