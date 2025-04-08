struct Large {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Slice;
    f5: String;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: Cell?;
    f10: Slice?;
    f11: String?;
    f12: Address?;
}

contract ManyBigFields {
    s: Large;

    init() {
        self.s = Large{
            f1:1,f2:true,f3:emptyCell(),f4:emptyCell().asSlice(),f5:"hi",f6:myAddress(),
            f7:null,f8:null,f9:null,f10:null,f11:null,f12:null
        };
    }
}