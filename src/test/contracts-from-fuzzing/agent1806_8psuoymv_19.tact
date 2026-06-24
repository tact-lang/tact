contract OptionalAndSerial {
    a: Int?;
    b: Int as uint8;
    c: Bool?;
    d: String;
    init() {
        self.a = null;
        self.b = 5;
        self.c = true;
        self.d = "hi";
    }
}