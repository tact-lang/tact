contract OptionalMidDefault {
    a: Int = 5;
    b: Int?;
    c: Int = 9;

    init() {
        self.b = null;
    }
}