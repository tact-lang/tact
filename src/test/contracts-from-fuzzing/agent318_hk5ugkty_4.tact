struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Address;
    f8: Bool?;
    f9: String;
    f10: Int;
}

contract ManyFieldsContract {
    st: ManyFields;

    init() {
        self.st = ManyFields{
            f1:1,f2:2,f3:true,f4:"hi",f5:emptyCell(),f6:emptyCell().asSlice(),f7:myAddress(),f8:null,f9:"bye",f10:10
        };
    }
}