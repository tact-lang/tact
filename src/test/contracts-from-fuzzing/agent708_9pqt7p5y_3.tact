struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Int;
}

contract VariedFields {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            a: 1,
            b: true,
            c: "hello",
            d: 2,
            e: false,
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: myAddress(),
            j: 3
        };
    }
}
