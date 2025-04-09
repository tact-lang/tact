struct LargeStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Address?;
    f11: Cell?;
    f12: Slice?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Address;
    f17: Cell;
    f18: Slice;
    f19: Int?;
    f20: Bool?;
    f21: String?;
    f22: Address?;
    f23: Cell?;
    f24: Slice?;
}

contract LargeStructTest {
    bigfield: LargeStruct;

    init() {
        self.bigfield = LargeStruct{
            f1:1,f2:true,f3:"a",f4:myAddress(),f5:emptyCell(),f6:emptyCell().asSlice(),
            f7:1,f8:true,f9:"b",f10:myAddress(),f11:emptyCell(),f12:emptyCell().asSlice(),
            f13:2,f14:false,f15:"c",f16:myAddress(),f17:emptyCell(),f18:emptyCell().asSlice(),
            f19:2,f20:false,f21:"d",f22:myAddress(),f23:emptyCell(),f24:emptyCell().asSlice(),
        };
    }
}
