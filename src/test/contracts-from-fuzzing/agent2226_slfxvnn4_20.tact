struct S {
    intF: Int;
    boolF: Bool;
    strF: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    cellF: Cell;
    sliceF: Slice;
    addrF: Address;
}

contract DiverseFields {
    s: S;
    init() {
        self.s = S{
            intF: 42,
            boolF: false,
            strF: "string",
            optInt: null,
            optBool: true,
            optStr: null,
            cellF: emptyCell(),
            sliceF: emptyCell().asSlice(),
            addrF: myAddress()
        };
    }
}