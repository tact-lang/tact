struct DiverseStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
}

contract DiverseStructTest {
    field: DiverseStruct;

    init() {
        self.field = DiverseStruct{
            a: 1,
            b: true,
            c: "abc",
            d: null,
            e: null,
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null
        };
    }
}