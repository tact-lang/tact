struct MegaStruct {
    f1: Int;
    f2: Bool;
    f3: Slice;
    f4: Address;
    f5: String;
    f6: Cell;
    f7: Int;
    f8: Bool;
    f9: Slice;
    f10: Address;
}

contract NestedMegaTest {
    field: MegaStruct;

    init() {
        self.field = MegaStruct{
            f1:1,f2:true,f3:emptyCell().asSlice(),f4:myAddress(),
            f5:"hi",f6:emptyCell(),f7:7,f8:false,f9:emptyCell().asSlice(),f10:myAddress()
        };
    }
}