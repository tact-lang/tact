struct AllTypes {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: String;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Address;
    i: Int?;
    j: String?;
    k: Bool?;
}

contract PrimitivesComposite {
    storage: AllTypes;

    init() {
        self.storage = AllTypes{
            a: 1,
            b: 2,
            c: true,
            d: "abc",
            e: emptyCell(),
            f: beginCell(),
            g: emptyCell().asSlice(),
            h: myAddress(),
            i: null,
            j: null,
            k: null
        };
    }
}