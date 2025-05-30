struct FlatBig {
    x1: Int;
    x2: Int?;
    x3: Bool;
    x4: String;
    x5: Cell;
    x6: Slice;
    x7: Address;
    x8: Int;
    x9: Int?;
    x10: Bool?;
    x11: String?;
    x12: Address?;
    x13: Cell?;
}

contract LotsOfFields {
    state: FlatBig;

    init() {
        self.state = FlatBig{
            x1:1,x2:null,x3:true,x4:"A",
            x5:emptyCell(),x6:emptyCell().asSlice(),
            x7:myAddress(),x8:-38,x9:null,x10:null,
            x11:null,x12:null,x13:null
        };
    }
}
