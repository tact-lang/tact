struct AllTypes {
    intF: Int;
    boolF: Bool;
    addr: Address;
    cellF: Cell;
    sliceF: Slice;
    builderF: Builder;
    stringF: String;
}

contract StructAllTypes {
    st: AllTypes;

    init() {
        self.st = AllTypes{
            intF: 1,
            boolF: false,
            addr: myAddress(),
            cellF: emptyCell(),
            sliceF: emptyCell().asSlice(),
            builderF: beginCell(),
            stringF: "hi"
        };
    }
}
