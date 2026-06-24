contract OptionalSerialize {
    n: Int?;
    m: Int as uint32;
    k: Int?;

    init() {
        self.n = null;
        self.m = 5;
        self.k = null;
    }
}
