struct LongStruct {
    f1: Int;  f2: Bool;  f3: String;  f4: Address;  f5: Int?;
    f6: Bool?;  f7: String?;  f8: Address?;  f9: Cell;  f10: Slice;
    f11: Int;  f12: Bool;  f13: String;  f14: Address;  f15: Int?;
    f16: Bool?;  f17: String?;  f18: Address?;  f19: Cell;  f20: Slice;
}

contract TestContract {
    bigData: LongStruct;

    init() {
        self.bigData = LongStruct{
            f1:1, f2:true, f3:"s", f4:myAddress(), f5:null,
            f6:null, f7:null, f8:null, f9:emptyCell(), f10:emptyCell().asSlice(),
            f11:2, f12:false, f13:"t", f14:myAddress(), f15:null,
            f16:null, f17:null, f18:null, f19:emptyCell(), f20:emptyCell().asSlice(),
        };
    }

    receive() {
        let _ = self.bigData.f1;
    }
}