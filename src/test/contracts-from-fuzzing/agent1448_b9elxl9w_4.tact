struct BigStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Bool;
    f12: Bool?;
    f13: Address;
    f14: Address?;
    f15: Cell;
    f16: Cell?;
    f17: Slice;
    f18: Slice?;
    f19: String;
    f20: String?;
}

contract ManyFields {
    storage: BigStruct;

    init() {
        self.storage = BigStruct{
            f1: 1, f2:2, f3:3, f4:4, f5:5, f6:6, f7:7, f8:8, f9:9, f10:10,
            f11:true, f12:null, f13:myAddress(), f14:null, f15:emptyCell(), f16:null,
            f17:emptyCell().asSlice(), f18:null, f19:"hello", f20:null
        };
    }
}