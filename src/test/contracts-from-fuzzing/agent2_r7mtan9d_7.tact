struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Address;
    f12: Cell;
    f13: Slice;
    f14: Int;
    f15: Bool;
}

contract TestContract {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            f1:1, f2:true, f3:"s", f4:myAddress(), f5:emptyCell(),
            f6:emptyCell().asSlice(), f7:7, f8:8, f9:false, f10:"t",
            f11:myAddress(), f12:emptyCell(), f13:emptyCell().asSlice(),
            f14:14, f15:true
        };
    }
}