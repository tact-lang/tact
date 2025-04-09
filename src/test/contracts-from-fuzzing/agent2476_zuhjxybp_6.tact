struct FlatNest {
    n1: Int;
    n2: Int?;
    n3: Bool;
    n4: Bool?;
    n5: String;
    n6: String?;
    n7: Cell;
    n8: Cell?;
    n9: Slice;
    n10: Slice?;
}

contract FlatStruct {
    s: FlatNest;
    init() {
        self.s = FlatNest{
            n1:1, n2:null, n3:true, n4:null,
            n5:"hi", n6:null, n7:emptyCell(), n8:null,
            n9:emptyCell().asSlice(), n10:null,
        };
    }
}