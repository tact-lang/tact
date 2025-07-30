struct BigOne {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Slice;
    g: Address;
    h: Cell;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract TestStorage {
    data: BigOne;

    init() {
        self.data = BigOne{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "test",
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: emptyCell(),
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}
