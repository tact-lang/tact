struct LongFields {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: String;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Cell;
    f10: Cell;
    f11: Slice;
    f12: Slice;
    f13: Address;
    f14: Address;
    f15: Int;
    f16: Bool;
}

contract TestContract {
    data: LongFields;

    init() {
        self.data = LongFields{
            f1:1,f2:true,f3:2,f4:false,f5:"x",
            f6:3,f7:null,f8:null,
            f9:emptyCell(),f10:emptyCell(),
            f11:emptyCell().asSlice(),f12:emptyCell().asSlice(),
            f13:myAddress(),f14:myAddress(),
            f15:5,f16:true
        };
    }
}