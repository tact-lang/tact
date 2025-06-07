contract AllOptionalFields {
    x: Int?;
    y: Bool?;
    s: String?;
    a: Address?;

    init() {
        self.x = null;
        self.y = null;
        self.s = null;
        self.a = null;
    }
}