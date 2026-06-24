// Large contract with a long list of mixed persistent storage fields
contract TestContract {
    x1: Int = 1;
    x2: Bool = true;
    x3: Int?;
    x4: String = "foo";
    x5: Bool?;
    x6: Int = 42;
    x7: String?;
    x8: Address;
    x9: Int = 9;
    x10: Bool = false;
    x11: Int?;
    x12: String = "bar";
    x13: Bool?;
    x14: Int = 43;
    x15: String?;
    x16: Address;

    init() {
        self.x8 = myAddress();
        self.x16 = myAddress();
        self.x3 = null;
        self.x5 = null;
        self.x7 = null;
        self.x11 = null;
        self.x13 = null;
        self.x15 = null;
    }

    receive() {
        self.x1 = self.x1 + 1;
    }
}