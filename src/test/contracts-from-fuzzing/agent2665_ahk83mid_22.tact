contract DefaultVsNullOpt {
    a: Int? = null;
    b: Bool? = null;

    init() {
        self.a = null;
        self.b = null;
    }
}