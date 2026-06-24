contract ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;

    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
        self.o4 = myAddress();
        self.o5 = emptyCell();
        self.o6 = emptyCell().asSlice();
    }
}