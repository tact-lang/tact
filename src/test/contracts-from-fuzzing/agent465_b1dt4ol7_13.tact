// Edge test: contract persistent state with many optional fields
contract TestContract {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Cell?;
    o6: Slice?;
    o7: Builder?;
    o8: Int?;
    o9: Bool?;
    o10: String?;

    init() {
        self.o1 = null;
        self.o2 = true;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
        self.o6 = null;
        self.o7 = null;
        self.o8 = 8;
        self.o9 = false;
        self.o10 = "hi";
    }
}
