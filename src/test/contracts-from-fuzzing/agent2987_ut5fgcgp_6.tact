struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Bool;
    f8: Bool;
    f9: Address;
    f10: Slice;
    f11: Int?;
    f12: Bool?;
    f13: Address?;
    f14: Slice?;
    f15: Int;
}

contract LargeFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1:1, f2:2, f3:3, f4:4, f5:5,
            f6:6, f7:true, f8:false, f9:myAddress(),
            f10:emptyCell().asSlice(), f11:null, f12:null, f13:null, f14:null, f15:15
        };
    }
}
