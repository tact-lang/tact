contract OptionalInits {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        self.a = 10;
        self.b = null;
        self.c = null;
        self.d = "Hello";
    }
}