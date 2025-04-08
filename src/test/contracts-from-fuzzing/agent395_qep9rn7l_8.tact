struct LargeFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool?;
    f: Cell;
    g: Slice;
    h: String?;
    i: Int as int64;
    j: Int as uint16;
    k: Int as coins;
}

contract LargeFlatSingle {
    data: LargeFlat;

    init() {
        self.data = LargeFlat{
            a: 1,
            b: true,
            c: "ccc",
            d: myAddress(),
            e: false,
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: null,
            i: -123,
            j: 255,
            k: ton("3")
        };
    }
}
