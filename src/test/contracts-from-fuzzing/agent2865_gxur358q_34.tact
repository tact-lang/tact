contract OptionalBoolInt {
    a: Int?;
    b: Bool?;
    c: Int = 3;
    d: Bool = false;

    init() {
        self.a = null;
        self.b = true;
    }
}