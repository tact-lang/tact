contract OptionalAfterDefault {
    a: Int = 5;
    b: Int?;

    init() {
        self.b = null;
    }
}