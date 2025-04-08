struct Omnibus {
    intF: Int;
    boolF: Bool;
    strF: String;
    cellF: Cell;
    sliceF: Slice;
    builderF: Builder;
    addrF: Address;
    intF2: Int;
    strF2: String;
    boolF2: Bool;
}

contract OmnibusStorage {
    val: Omnibus;

    init() {
        self.val = Omnibus{
            intF:1,
            boolF:true,
            strF:"x",
            cellF:emptyCell(),
            sliceF:"y".asComment().asSlice(),
            builderF:beginCell(),
            addrF:myAddress(),
            intF2:2,
            strF2:"z",
            boolF2:false
        };
    }
}