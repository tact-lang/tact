contract LongList {
    i1: Int;
    i2: Int;
    i3: Bool;
    i4: Bool;
    i5: Address;
    i6: Int?;
    i7: Cell;
    i8: Slice;
    i9: String;
    i10: Bool?;
    i11: Cell?;
    i12: String?;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = true;
        self.i4 = false;
        self.i5 = myAddress();
        self.i6 = null;
        self.i7 = emptyCell();
        self.i8 = emptyCell().asSlice();
        self.i9 = "hello";
        self.i10 = null;
        self.i11 = null;
        self.i12 = null;
    }
}
