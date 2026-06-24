// contract with giant persistent tuple
contract BigTuple {
    x1: Int; x2: Bool; x3: String; x4: Address; x5: Int?; x6: String?; x7: Bool?; x8: Address?;
    init() {
        self.x1 = 10;
        self.x2 = true;
        self.x3 = "foo";
        self.x4 = myAddress();
        self.x5 = null;
        self.x6 = null;
        self.x7 = null;
        self.x8 = null;
    }
}
