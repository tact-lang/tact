contract InitAndDefaults {
    a: Int = 0;
    b: Int;
    c: Bool = false;
    d: Bool;

    init() {
        self.b = 5;
        self.d = true;
    }
}
