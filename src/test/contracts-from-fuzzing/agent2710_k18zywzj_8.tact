struct Mix {
    intF: Int;
    boolF: Bool;
    strF: String;
    addrF: Address;
    cellF: Cell;
    sliceF: Slice;
    builderF: Builder;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
}

contract MixedStructStorage {
    x: Mix;

    init() {
        self.x = Mix{
            intF: 1,
            boolF: false,
            strF: "hello",
            addrF: myAddress(),
            cellF: emptyCell(),
            sliceF: emptyCell().asSlice(),
            builderF: beginCell(),
            optInt: null,
            optBool: null,
            optAddr: null
        };
    }
}