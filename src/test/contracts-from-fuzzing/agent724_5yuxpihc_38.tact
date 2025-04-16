contract InitNonNullOptionals {
    a: Int?;
    b: Bool?;

    init() {
        self.a = 42;
        self.b = true;
    }
}