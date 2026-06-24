contract PartialDefaults {
    a: Int = 5;
    b: Int;
    c: Bool = false;
    d: Bool;

    init() {
        self.b = 10;
        self.d = true;
    }
}