contract OptionalStringInt {
    s: String?;
    i: Int?;

    init() {
        self.s = null;
        self.i = 10;
    }
}