struct BigNested {
    nested1: Int;
    nested2: Int;
    nested3: Int;
    nested4: Int;
    nested5: Int;
    nested6: Int;
    nested7: Int;
    nested8: Int;
    nested9: Int;
    nested10: Int;
}

contract BigFieldsContract {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Builder;
    f6: Slice;
    f7: String;
    f8: BigNested;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = beginCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = "test";
        self.f8 = BigNested{
            nested1:1, nested2:2, nested3:3, nested4:4, nested5:5,
            nested6:6, nested7:7, nested8:8, nested9:9, nested10:10
        };
    }
}