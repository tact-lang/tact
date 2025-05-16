// wider breadth, more optional primitive fields at top level
contract TestContract {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Bool?;
    f5: String?;
    f6: Address?;
    f7: Bool?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.f7 = null;
    }
}