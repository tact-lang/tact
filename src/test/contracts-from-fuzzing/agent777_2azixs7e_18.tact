contract EmptyDefaults {
    a: Int = 0;
    b: Bool = false;
    c: Int?;
    d: Bool?;

    init() {
        self.c = null;
        self.d = null;
    }
}