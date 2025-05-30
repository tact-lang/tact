// contract with *dozens* of optional primitive fields but NO defaults
contract OptionalsFlood {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Bool?;
    o6: Bool?;
    o7: String?;
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
