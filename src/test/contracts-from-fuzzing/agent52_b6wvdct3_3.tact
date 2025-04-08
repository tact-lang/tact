contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Int?;
    f8: map<Int, Int>;
    f9: String;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = self.f4.asSlice();
        self.f6 = beginCell();
        self.f7 = null;
        self.f8 = emptyMap();
        self.f9 = "test";
    }
}