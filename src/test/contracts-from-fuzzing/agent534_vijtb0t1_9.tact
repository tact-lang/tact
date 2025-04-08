struct Combine {
    i: Int;
    b: Bool;
    s: String;
    ca: Cell;
    slc: Slice;
    adr: Address;
    sOpt: String?;
    bOpt: Bool?;
}

contract StorageCombo {
    combo: Combine;

    init() {
        self.combo = Combine{
            i: 7,
            b: false,
            s: "yo",
            ca: emptyCell(),
            slc: emptyCell().asSlice(),
            adr: myAddress(),
            sOpt: null,
            bOpt: null,
        };
    }
}