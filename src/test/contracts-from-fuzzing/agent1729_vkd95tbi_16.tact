struct StructWithVariedTypes {
    intF: Int;
    boolF: Bool;
    strF: String;
    addrF: Address?;
    cellF: Cell;
    slcF: Slice;
    buildF: Builder;
}

contract PersistVaried {
    field: StructWithVariedTypes;

    init() {
        self.field = StructWithVariedTypes{
            intF: 100,
            boolF: true,
            strF: "test",
            addrF: null,
            cellF: emptyCell(),
            slcF: emptyCell().asSlice(),
            buildF: beginCell()
        };
    }
}