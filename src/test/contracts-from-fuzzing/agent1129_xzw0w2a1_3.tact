struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: String;
    i: Bool?
}

contract WideStorage {
    wide: WideStruct;

    init() {
        self.wide = WideStruct{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: "y",
            i: false
        };
    }
}