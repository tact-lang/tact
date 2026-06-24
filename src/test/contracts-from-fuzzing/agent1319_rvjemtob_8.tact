struct LongStruct {
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
}

contract LongStructTest {
    data: LongStruct;

    init() {
        self.data = LongStruct {
            f1:1, f2:true, f3:"a", f4:emptyCell(), f5:emptyCell().asSlice(),
            f6:2, f7:false, f8:"b", f9:emptyCell(), f10:emptyCell().asSlice()
        };
    }
}