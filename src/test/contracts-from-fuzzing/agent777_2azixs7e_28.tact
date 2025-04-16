contract WithDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;

    init() {
        self.c = 7;
        self.d = null;
    }
}