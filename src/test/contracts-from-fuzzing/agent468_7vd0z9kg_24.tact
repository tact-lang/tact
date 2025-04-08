// Contract with nested struct with many diversified fields
struct Varied {
    intF: Int;
    optIntF: Int?;
    boolF: Bool;
    optBoolF: Bool?;
    stringF: String;
    optStringF: String?;
    addrF: Address;
    optAddrF: Address?;
    sliceF: Slice;
    optSliceF: Slice?;
    cellF: Cell;
    optCellF: Cell?;
}

contract VariedNestedTest {
    nested: Varied;

    init() {
        self.nested = Varied{
            intF: 1,
            optIntF: null,
            boolF: true,
            optBoolF: null,
            stringF: "abc",
            optStringF: null,
            addrF: myAddress(),
            optAddrF: null,
            sliceF: emptyCell().asSlice(),
            optSliceF: null,
            cellF: emptyCell(),
            optCellF: null
        };
    }
}