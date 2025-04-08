contract OptionalDefault {
    a: Int? = null;
    b: Int?;

    init() {
        self.a = null;
        self.b = null;
    }
}