contract OptionalDefaults {
    o1: Int?;
    o2: Bool?;

    init() {
        self.o1 = null;
        self.o2 = true;
    }

    receive() {
        self.o2 = !self.o2!!;
    }
}