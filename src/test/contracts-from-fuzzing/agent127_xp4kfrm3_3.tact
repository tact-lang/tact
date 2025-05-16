contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "x";
        self.f4 = emptyCell();
        self.f5 = self.f4.asSlice();
        self.f6 = myAddress();
    }
}