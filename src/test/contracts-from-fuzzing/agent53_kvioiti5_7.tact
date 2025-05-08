struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: Address?;
    f9: Bool?;
    f10: String?;
}

contract HasBigStruct {
    s: ManyFields;
    init() {
        self.s = ManyFields{
            f1:1, f2:true, f3:"txt", f4:myAddress(), f5:emptyCell(), f6:emptyCell().asSlice(),
            f7:null, f8:null, f9:null, f10:null
        };
    }
}