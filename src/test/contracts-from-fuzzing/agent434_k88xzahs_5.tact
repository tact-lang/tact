struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Slice;
    f7: Int?;
    f8: Bool?;
    f9: String;
    f10: Int;
    f11: Bool;
    f12: Int?;
    f13: Address;
    f14: Cell;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1,f2:true,f3:"s",f4:emptyCell(),f5:myAddress(),f6:emptyCell().asSlice(),
            f7:null,f8:false,f9:"t",f10:2,f11:true,f12:null,f13:myAddress(),f14:emptyCell()
        };
    }
}