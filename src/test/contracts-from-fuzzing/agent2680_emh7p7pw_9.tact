contract ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Cell?;
    o4: Address?;
    o5: String?;
    o6: Slice?;
    o7: Builder?;

    init() {
        self.o1 = 1;
        self.o2 = true;
        self.o3 = emptyCell();
        self.o4 = myAddress();
        self.o5 = "hi";
        self.o6 = emptyCell().asSlice();
        self.o7 = beginCell();
    }
}