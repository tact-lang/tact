contract OptionalDefaulted {
    n: Int? = null;
    s: String? = null;

    init() {
        self.n = 7;
        self.s = "non-null";
    }
}