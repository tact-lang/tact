contract OnlyInitDefaults {
    a: Int;
    b: Int;

    init() {
        self.a = 177;
        self.b = self.a + 23;
    }
}