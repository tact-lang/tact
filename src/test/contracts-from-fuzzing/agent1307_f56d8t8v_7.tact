struct Mix {
    intF: Int;
    boolF: Bool;
    strF: String;
    cellF: Cell;
    sliceF: Slice;
    addrF: Address;
}

contract MixFields {
    data: Mix;

    init() {
        self.data = Mix{
            intF: 0,
            boolF: true,
            strF: "hi",
            cellF: emptyCell(),
            sliceF: emptyCell().asSlice(),
            addrF: myAddress()
        };
    }
}