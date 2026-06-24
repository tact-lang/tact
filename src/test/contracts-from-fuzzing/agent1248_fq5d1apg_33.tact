contract OnlyOptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: String?;

    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
    }
}
