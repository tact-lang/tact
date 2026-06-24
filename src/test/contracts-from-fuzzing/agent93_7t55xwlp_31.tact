contract OptionalInInit {
    a: Int;
    b: String?;

    init() {
        self.a = 99;
        self.b = null;
    }
}