struct Wide {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Slice;
    f6: Cell;
    f7: Bool;
    f8: String;
    f9: Int?;
    f10: Address;
    f11: Bool?;
    f12: String;
}

contract WideContract {
    data: Wide;

    init() {
        self.data = Wide{
            f1:1, f2:2, f3:true, f4:"a", f5:emptyCell().asSlice(),
            f6:emptyCell(), f7:false, f8:"b", f9:null, f10:myAddress(),
            f11:true, f12:"c"
        };
    }
}