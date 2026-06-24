contract OptionalsAndSerialization {
    a: Int?;
    b: Int as uint32;
    c: String?;
    d: Bool?;

    init() {
        self.a = 77;
        self.b = 1234;
        self.c = "optional";
        self.d = true;
    }
}
