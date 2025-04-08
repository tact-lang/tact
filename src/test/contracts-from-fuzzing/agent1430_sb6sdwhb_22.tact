struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Slice;
    f11: Cell;
    f12: Address;
}

contract BigTest {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            f1:1, f2:true, f3:"a", f4:emptyCell().asSlice(), f5:emptyCell(), f6:myAddress(),
            f7:2, f8:false, f9:"b", f10:emptyCell().asSlice(), f11:emptyCell(), f12:myAddress()
        };
    }
}
