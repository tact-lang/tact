contract MultiOptional {
    o1: Int?;
    o2: String?;
    o3: Bool?;

    init() {
        self.o1 = 1;
        self.o2 = null;
        self.o3 = false;
    }
}