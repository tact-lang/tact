struct LongOne {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: String;
    f8: Bool;
    f9: Int;
    f10: Int;
    f11: Bool;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Address;
}

contract Test {
    big: LongOne;

    init() {
        self.big = LongOne{
            f1:1,f2:true,f3:"a",f4:emptyCell(),f5:emptyCell().asSlice(),f6:myAddress(),
            f7:"b",f8:false,f9:2,f10:3,f11:true,f12:"c",f13:4,f14:false,f15:"d",f16:myAddress()
        };
    }
}
