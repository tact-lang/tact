contract LargeOptionalStorage {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
    o6: Int?;
    o7: Bool?;
    o8: String?;
    o9: Address?;
    o10: Cell?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
        self.o6 = 6;
        self.o7 = true;
        self.o8 = "hello";
        self.o9 = myAddress();
        self.o10 = emptyCell();
    }
}