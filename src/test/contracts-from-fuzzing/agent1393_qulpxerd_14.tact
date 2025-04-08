// Contract with many optional primitive fields
contract ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Int?;
    o4: Bool?;
    o5: Address?;
    o6: Slice?;
    o7: Cell?;
    o8: String?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
        self.o5 = null;
        self.o6 = null;
        self.o7 = null;
        self.o8 = null;
    }
}
