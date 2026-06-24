struct LongStruct {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
    f5: Bool?;
    f6: Address;
    f7: Bool;
    f8: String;
    f9: Int?;
    f10: Address;
    f11: Cell;
    f12: String;
    f13: Int;
    f14: Bool;
    f15: String;
}

contract LongFields {
    big: LongStruct;

    init() {
        self.big = LongStruct{
            f1:1, f2:true, f3:"a", f4:2, f5:null, f6:myAddress(),
            f7:false, f8:"b", f9:null, f10:myAddress(), f11:emptyCell(),
            f12:"c", f13:3, f14:true, f15:"d",
        };
    }
}