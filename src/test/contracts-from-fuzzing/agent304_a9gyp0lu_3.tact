struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Bool?;
    f9: String?;
    f10: Int?;
    f11: Bool;
    f12: String;
}

contract BigFields {
    big: BigStruct;
    init() {
        self.big = BigStruct{
            f1:1, f2:true, f3:"3", f4:myAddress(), f5:emptyCell(), f6:emptyCell().asSlice(), f7:beginCell(),
            f8:null, f9:null, f10:null, f11:false, f12:"ok"
        };
    }
}
