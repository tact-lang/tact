struct LargeStruct {
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
    f11: Int;
    f12: Bool;
    f13: Bool;
    f14: Bool;
    f15: Bool;
    f16: String;
    f17: String;
    f18: Address;
    f19: Cell;
    f20: Cell;
}

contract LargeFields {
    mega: LargeStruct;

    init() {
        self.mega = LargeStruct{
            f1: 1, f2: 2, f3: 3, f4:4, f5:5, f6:6, f7:7, f8:8, f9:9, f10:10,
            f11:11, f12:true, f13:false, f14:true, f15:false,
            f16:"a", f17:"b", f18:myAddress(),
            f19:emptyCell(), f20:emptyCell()
        };
    }

    receive() {}
}