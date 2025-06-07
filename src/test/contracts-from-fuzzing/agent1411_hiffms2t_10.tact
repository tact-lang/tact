struct LongFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Cell;
    f11: Slice;
    f12: Address;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Cell;
    f17: Slice;
    f18: Address;
    f19: Int;
    f20: Bool;
}

contract TestContract {
    data: LongFields;
    init() {
        self.data = LongFields{
            f1:1,f2:true,f3:"a",f4:emptyCell(),f5:emptyCell().asSlice(),f6:myAddress(),
            f7:2,f8:false,f9:"b",f10:emptyCell(),f11:emptyCell().asSlice(),f12:myAddress(),
            f13:3,f14:true,f15:"c",f16:emptyCell(),f17:emptyCell().asSlice(),f18:myAddress(),
            f19:4,f20:false,
        };
    }
}