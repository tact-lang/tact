struct MixedFields {
    n: Int;
    s: String;
    flag: Bool;
    piece: Cell;
    slice: Slice;
    addr: Address;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract MixedContract {
    mixed: MixedFields;
    
    init() {
        self.mixed = MixedFields{
            n: 1,
            s: "test",
            flag: true,
            piece: emptyCell(),
            slice: emptyCell().asSlice(),
            addr: myAddress(),
            optInt: null,
            optStr: null,
            optBool: null
        };
    }
}
