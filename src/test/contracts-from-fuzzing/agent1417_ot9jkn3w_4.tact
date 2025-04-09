contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: Bool?;
    f9: String;
    f10: Int;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = null;
        self.f8 = false;
        self.f9 = "bye";
        self.f10 = 10;
    }
}