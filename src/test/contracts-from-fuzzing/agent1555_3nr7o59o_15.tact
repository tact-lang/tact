contract OptionalDefaults {
    a: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.a = null;
        self.b = null;
        self.s = null;
    }

    receive(){}
}