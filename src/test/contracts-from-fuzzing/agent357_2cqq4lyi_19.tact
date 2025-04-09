struct ManyFields {
    f0: Int;
    f1: Bool;
    f2: Cell;
    f3: Address;
    f4: Int?;
    f5: String?;
    f6: Bool?;
    f7: Slice?;
    f8: String;
    f9: Slice;
}

contract LargeStructStorage {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f0:0, f1:true, f2:emptyCell(), f3:myAddress(), f4:null, f5:null, f6:null, f7:null, f8:"hi", f9:emptyCell().asSlice(),
        };
    }
}