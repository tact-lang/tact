contract ManyOptionalFields {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: Slice?;
    o6: String?;
    o7: Int?;
    o8: Bool?;

    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
        self.o4 = emptyCell();
        self.o5 = emptyCell().asSlice();
        self.o6 = "hello";
        self.o7 = 123;
        self.o8 = null;
    }
}