contract OptionalWithInit {
    a: Int?;
    b: Bool?;

    init() {
        self.a = null;
        self.b = true;
    }
}