struct LongStruct {
    f0: Int;
    f1: Bool;
    f2: String;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Int?;
    f8: Bool?;
    f9: String?;
}

contract LongStructStorage {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            f0:1, f1:true, f2:"x", f3:myAddress(), f4:emptyCell(),
            f5:emptyCell().asSlice(), f6:beginCell(),
            f7:null, f8:null, f9:null
        };
    }
}