contract ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: Slice?;
    o6: String?;

    init() {
        self.o1 = 11;
        self.o2 = false;
        self.o3 = null;
        self.o4 = emptyCell();
        self.o5 = emptyCell().asSlice();
        self.o6 = null;
    }
}