struct HasAllTypes {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: String;
    l: String?;
}

contract StructAllTypesHolder {
    var: HasAllTypes;

    init() {
        self.var = HasAllTypes{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: myAddress(),
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: "abc",
            l: null
        };
    }
}