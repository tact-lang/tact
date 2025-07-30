contract ManyOptionalFields {
    o1: Int?;
    o2: Address?;
    o3: Bool?;
    o4: Cell?;
    o5: Builder?;
    o6: Slice?;
    o7: String?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
        self.o6 = null;
        self.o7 = null;
    }
}