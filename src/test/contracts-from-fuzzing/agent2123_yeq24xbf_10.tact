struct LargeStruct {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Cell;
    f6: Address;
    f7: Slice;
    f8: Bool?;
    f9: Int?;
    f10: Address?;
    f11: String?;
    f12: Slice?;
    f13: Cell?;
}

contract LargeStructInState {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            f1:1,f2:2,f3:true,f4:"x",f5:emptyCell(),f6:myAddress(),f7:emptyCell().asSlice(),
            f8:null,f9:9,f10:null,f11:"opt",f12:null,f13:emptyCell()
        };
    }
}