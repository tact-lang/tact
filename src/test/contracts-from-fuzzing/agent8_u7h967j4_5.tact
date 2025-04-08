struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
}

contract DiverseFields {
    data: S1;
    init() {
        self.data = S1{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: null,
            j: null,
            k: null,
            l: null
        };
    }
}