contract MixedTypes {
    f1: Int as uint16;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    init() {
        self.f1 = 65535;
        self.f2 = true;
        self.f3 = "text";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = myAddress();
    }
}