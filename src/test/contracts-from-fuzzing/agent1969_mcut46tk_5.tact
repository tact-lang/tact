struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Address;
    f8: Int;
    f9: Bool;
    f10: String;
}

contract LotsOfStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1:1, f2:true, f3:null, f4:"hi", f5:emptyCell(),
            f6:emptyCell().asSlice(), f7:myAddress(), f8:8, f9:false, f10:"bye"
        };
    }
}