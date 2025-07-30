contract OptionalMix {
    o1: Int?;
    d1: Int = 1;
    o2: Bool?;
    d2: Int = 2;
    o3: String?;
    d3: Int = 3;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
    }
}