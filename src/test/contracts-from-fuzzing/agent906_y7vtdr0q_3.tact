struct WideStruct {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Int;
}

contract WideContract {
    field: WideStruct;

    init() {
        self.field = WideStruct{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "test",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: myAddress(),
            j: 42,
        };
    }
}