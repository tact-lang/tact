contract OptionalAfterDefault {
    a: Int = 5;
    b: Int?;

    init() {
        self.a = 50;
        self.b = null;
    }
}
