struct ExoticTypes {
    addr: Address;
    cellField: Cell;
    sliceField: Slice;
    str: String;
    flag: Bool;
}

contract ExoticFields {
    data: ExoticTypes;

    init() {
        self.data = ExoticTypes{
            addr: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            str: "hi",
            flag: true
        };
    }
}