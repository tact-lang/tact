contract OptionalInit {
    a: Int?;
    b: Bool?;

    init() {
        self.a = 55;
        self.b = true;
    }
}