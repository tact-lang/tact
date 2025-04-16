contract OptionalAfterDefault {
    a: Int = 1;
    b: String?;
    c: Bool = false;
    d: Int?;

    init() {
        self.b = "hello";
        self.d = 42;
    }
}