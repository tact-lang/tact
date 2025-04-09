struct LongList {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Cell;
    f5: String;
    f6: Slice;
    f7: Bool?;
    f8: Address;
    f9: Int;
    f10: Bool;
    f11: String?;
    f12: Cell;
    f13: Slice;
    f14: Int?;
    f15: String;
    f16: Address;
}

contract TestContract {
    data: LongList;

    init() {
        self.data = LongList{
            f1:1,f2:2,f3:true,f4:emptyCell(),f5:"x",f6:emptyCell().asSlice(),
            f7:null,f8:myAddress(),f9:9,f10:false,f11:null,f12:emptyCell(),
            f13:emptyCell().asSlice(),f14:null,f15:"y",f16:myAddress()
        };
    }
}