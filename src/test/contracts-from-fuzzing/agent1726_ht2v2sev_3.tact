struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Bool?;
    f8: Address;
    f9: Bool;
    f10: String;
    f11: Int;
    f12: Bool;
    f13: String;
}

contract ManyFieldsHolder {
    data: ManyFields;
    init() {
        self.data = ManyFields{
            f1:1, f2:true, f3:myAddress(), f4:emptyCell(), f5:emptyCell().asSlice(),
            f6:"", f7:null, f8:myAddress(), f9:false, f10:"x", f11:42, f12:true, f13:"z"
        };
    }
}