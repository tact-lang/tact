contract OptionalTopLevel {
    num: Int?;
    b: Bool?;

    init() {
        self.num = null;
        self.b = true;
    }
}