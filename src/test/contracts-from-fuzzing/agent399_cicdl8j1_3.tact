struct WithManyTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optIntField: Int?;
    optAddrField: Address?;
}

contract ManyTypesTest {
    data: WithManyTypes;

    init() {
        self.data = WithManyTypes{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "abc",
            optIntField: null,
            optAddrField: null
        };
    }
}