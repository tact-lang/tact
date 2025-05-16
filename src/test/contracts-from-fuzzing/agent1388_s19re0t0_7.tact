struct WideStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Int;
    f7: Bool;
    f8: String;
    f9: Cell;
    f10: Slice;
    f11: Int;
    f12: Bool;
}

contract BigStructStorage {
    payload: WideStruct;

    init() {
        self.payload = WideStruct{
            f1:1, f2:true, f3:"x", f4:emptyCell(), f5:emptyCell().asSlice(),
            f6:2, f7:false, f8:"y", f9:emptyCell(), f10:emptyCell().asSlice(),
            f11:3, f12:true
        };
    }
}
