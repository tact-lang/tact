contract PartialDefaults {
    a: Int;
    b: Int = 2;
    c: Int;

    init() {
        self.a = 10;
        self.c = 30;
    }
}