// Large structure with many primitive fields
struct LargeStruct {
    f01: Int;
    f02: Int;
    f03: Int;
    f04: Bool;
    f05: Bool;
    f06: Bool;
    f07: Address;
    f08: Address;
    f09: Cell;
    f10: Cell;
    f11: Slice;
    f12: Slice;
    f13: String;
    f14: String;
    f15: Int?;
    f16: Address?;
    f17: Bool?;
    f18: String?;
    f19: Slice?;
    f20: Cell?;
}

contract TestContract {
    big: LargeStruct;
    init() {
        self.big = LargeStruct{
            f01:1, f02:2, f03:3,
            f04:true, f05:false, f06:true,
            f07:myAddress(), f08:myAddress(),
            f09:emptyCell(), f10:emptyCell(),
            f11:emptyCell().asSlice(), f12:emptyCell().asSlice(),
            f13:"a", f14:"b",
            f15:null, f16:null, f17:null, f18:null, f19:null, f20:null
        };
    }
}