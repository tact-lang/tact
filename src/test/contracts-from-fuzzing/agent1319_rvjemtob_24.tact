contract OptionalInlineAssign {
    a: Int?;
    b: String?;

    init() {
        self.a = 5;
        self.b = null;
    }
}