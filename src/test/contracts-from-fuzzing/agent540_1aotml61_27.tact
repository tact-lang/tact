contract OverlappingDefaults {
    a: Int? = null;
    b: Bool = true;
    c: Int?;

    init() {
        self.a = 99;
        self.b = false;
        self.c = null;
    }
}