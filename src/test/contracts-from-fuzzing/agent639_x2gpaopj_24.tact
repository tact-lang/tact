contract OnlyOptionals {
    o1: Int?;
    o2: Bool?;

    init() {
        self.o1 = null;
        self.o2 = null;
    }
}