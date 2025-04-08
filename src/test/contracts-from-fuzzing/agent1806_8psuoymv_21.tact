contract OptionalDefMix {
    a: Int?;
    b: Int = 2;
    c: Bool?;
    d: Bool = false;
    init() {
        self.a = null;
        self.c = null;
    }
}