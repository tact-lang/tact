contract HugeOptionalSet {
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: Bool?;
    o5: Cell?;
    o6: Address?;
    o7: Slice?;
    o8: Builder?;

    init() {
        self.o1 = null;
        self.o2 = 42;
        self.o3 = null;
        self.o4 = true;
        self.o5 = emptyCell();
        self.o6 = myAddress();
        self.o7 = emptyCell().asSlice();
        self.o8 = beginCell();
    }
}