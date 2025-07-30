contract InitOptionalDefaults {
    a: Int?;
    b: String?;
    c: Address?;
    d: Slice?;
    e: Builder?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}
