struct LargeStruct {
    f01: Int;
    f02: Bool;
    f03: Int?;
    f04: Bool?;
    f05: Address;
    f06: String;
    f07: Cell;
    f08: Slice;
    f09: Int;
    f10: Bool;
    f11: Int?;
    f12: Bool?;
    f13: Address;
    f14: String;
}

contract LotOfFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f01:1,f02:true,f03:null,f04:false,f05:myAddress(),
            f06:"hi",f07:emptyCell(),f08:emptyCell().asSlice(),f09:2,
            f10:false,f11:null,f12:true,f13:myAddress(),f14:"end"
        };
    }
}