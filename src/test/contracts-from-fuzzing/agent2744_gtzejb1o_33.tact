struct BigVariety {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract BigMixStorage {
    data: BigVariety;

    init() {
        self.data = BigVariety{
            a: 1,
            b: true,
            c: "str",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: false,
            i: null,
            j: null
        };
    }
}
