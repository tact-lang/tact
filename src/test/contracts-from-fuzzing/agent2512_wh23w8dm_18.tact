contract OptionalInits {
    a: Int?;
    b: String?;

    init() {
        self.a = 42;
        self.b = "hello";
    }
}