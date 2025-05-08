contract OptionalMix {
    i: Int = 1;
    j: Int?;
    k: Int = 2;
    l: Int?;

    init() {
        self.j = null;
        self.l = null;
    }
}