contract Test7 {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: Slice?;
    o6: String?;

    init() {
        self.o1 = 1;
        self.o2 = null;
        self.o3 = null;
        self.o4 = emptyCell();
        self.o5 = null;
        self.o6 = "optional";
    }
}