struct ManyFields {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Bool;
    a5: Bool;
    a6: String;
    a7: String;
    a8: Address;
    a9: Address;
    a10: Cell;
    a11: Slice;
    a12: Int?;
    a13: Bool?;
    a14: String?;
    a15: Address?;
}

contract WideStructPersistent {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a1:1,a2:2,a3:3,a4:true,a5:false,a6:"one",a7:"two",a8:myAddress(),a9:myAddress(),
            a10:emptyCell(),a11:emptyCell().asSlice(),a12:null,a13:null,a14:null,a15:null
        };
    }
}