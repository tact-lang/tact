contract MultipleOptionals {
    v1: Int?;
    v2: Int?;
    v3: Int?;

    init() {
        self.v1 = null;
        self.v2 = 42;
        self.v3 = null;
    }
}
