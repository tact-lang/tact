contract OptionalSer {
    a: Int? as uint32;
    b: Bool?;
    c: Int?;

    init() {
        self.a = null;
        self.b = true;
        self.c = 42;
    }
}