struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Bool?;
    f6: Int?;
    f7: String;
    f8: Address;
    f9: Slice;
    f10: String?;
}

contract ManyStorageFields {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            f1:1,f2:true,f3:"a",f4:emptyCell(),f5:null,f6:null,f7:"b",f8:myAddress(),f9:emptyCell().asSlice(),f10:null
        };
    }
}
