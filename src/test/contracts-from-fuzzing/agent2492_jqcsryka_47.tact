contract CrossDefaults {
    a: Int;
    b: Int = 2;
    c: Int?;
    d: Int? = null;

    init() {
        self.a = 1;
        self.c = null;
    }
}