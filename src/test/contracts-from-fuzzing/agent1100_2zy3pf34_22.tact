contract OptionalAfterDefault {
    a: Int = 0;
    b: Int?;

    init() {
        self.a = 1;
        self.b = null;
    }
}
