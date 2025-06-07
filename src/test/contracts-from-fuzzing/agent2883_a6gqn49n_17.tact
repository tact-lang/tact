contract OptionalDefaults {
    o1: Int? = null;
    o2: Bool? = null;
    o3: String? = null;

    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
    }
}