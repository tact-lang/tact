struct BigStruct {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Cell?;
    f11: Slice?;
    f12: Address?;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Int?;
    f17: Bool?;
    f18: String?;
    f19: Cell?;
    f20: Address?;
}

contract HugeStructTest {
    stuff: BigStruct;
    init() {
        self.stuff = BigStruct{
            f1:1,f2:true,f3:myAddress(),f4:emptyCell(),f5:emptyCell().asSlice(),f6:"s",
            f7:null,f8:null,f9:null,f10:null,f11:null,f12:null,
            f13:2,f14:false,f15:"x",
            f16:null,f17:null,f18:null,f19:null,f20:null
        };
    }
}