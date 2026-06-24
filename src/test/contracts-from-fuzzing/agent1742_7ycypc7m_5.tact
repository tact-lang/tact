struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: String;
    f6: Cell;
    f7: Slice;
    f8: Address;
    f9: Bool;
    f10: Int; 
}

contract ManyFieldsStorage {
    big: LargeStruct;

    init() {
        self.big = LargeStruct{
            f1: 1,f2:2,f3:3,f4:true,f5:"hi",f6:emptyCell(),f7:emptyCell().asSlice(),f8:myAddress(),f9:false,f10:10
        };
    }
}