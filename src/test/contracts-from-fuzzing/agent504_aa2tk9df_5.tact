struct LongStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Address;
    f8: Cell;
    f9: Slice;
    f10: Address;
}

contract LargeStructTest {
    val: LongStruct;

    init() {
        self.val = LongStruct{
            f1:1, f2:2, f3:true, f4:false, f5:"a", f6:"b",
            f7: myAddress(), f8: emptyCell(), f9: emptyCell().asSlice(),
            f10: myAddress()
        };
    }
}