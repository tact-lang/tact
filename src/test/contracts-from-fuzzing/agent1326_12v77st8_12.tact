contract OptionalDirectFields {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Cell?;
    o5: Slice?;
    o6: Address?;
    init() {
        self.o1 = 1;
        self.o2 = null;
        self.o3 = true;
        self.o4 = null;
        self.o5 = null;
        self.o6 = null;
    }
}