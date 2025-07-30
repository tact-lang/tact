// Many different primitive types and optionals as persistent fields
contract MixedPrimitives {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Address;
    f8: Address?;
    f9: Cell;
    f10: Cell?;

    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = true;
        self.f4 = null;
        self.f5 = "hello";
        self.f6 = null;
        self.f7 = myAddress();
        self.f8 = null;
        self.f9 = emptyCell();
        self.f10 = null;
    }
}