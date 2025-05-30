// Testing large flat struct with many primitive fields
struct LotsPrimitives {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Bool;
    f6: String;
    f7: String;
    f8: Address;
    f9: Address;
    f10: Slice;
    f11: Slice;
    f12: Cell;
    f13: Cell;
}

contract UseBigStruct {
    data: LotsPrimitives;

    init() {
        self.data = LotsPrimitives{
            f1:1, f2:2, f3:3,
            f4:true, f5:false,
            f6:"a", f7:"b",
            f8:myAddress(), f9:myAddress(),
            f10:emptyCell().asSlice(), f11:emptyCell().asSlice(),
            f12:emptyCell(), f13:emptyCell()
        };
    }
}
