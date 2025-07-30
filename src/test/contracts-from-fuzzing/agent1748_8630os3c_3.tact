struct WideStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool;
    e: String;
    f: Cell;
    g: Slice;
    h: String;
    i: Bool;
    j: Int?;
}

contract WideStorage {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "A",
            f: emptyCell(),
            g: emptyCell().asSlice(),
            h: "B",
            i: true,
            j: null
        };
    }
}