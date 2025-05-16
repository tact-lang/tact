contract OptionalInits {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = 10;
        self.b = "xyz";
        self.c = true;
    }
}
