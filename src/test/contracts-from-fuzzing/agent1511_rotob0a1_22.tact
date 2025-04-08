contract OptionalSerializations {
    a: Int as uint8;
    b: Int?;
    c: String?;

    init() {
        self.a = 5;
        self.b = null;
        self.c = null;
    }
}
