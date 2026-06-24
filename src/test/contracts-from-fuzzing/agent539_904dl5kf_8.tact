struct MultiStruct {
    intF: Int;
    boolF: Bool;
    addrF: Address;
    cellF: Cell;
    sliceF: Slice;
    strF: String;
}

contract TestContract {
    s1: MultiStruct;
    s2: MultiStruct;
    init() {
        self.s1 = MultiStruct{
            intF: 1,
            boolF: true,
            addrF: myAddress(),
            cellF: emptyCell(),
            sliceF: emptyCell().asSlice(),
            strF: "foo",
        };
        self.s2 = MultiStruct{
            intF: 2,
            boolF: false,
            addrF: myAddress(),
            cellF: emptyCell(),
            sliceF: emptyCell().asSlice(),
            strF: "bar",
        };
    }
}