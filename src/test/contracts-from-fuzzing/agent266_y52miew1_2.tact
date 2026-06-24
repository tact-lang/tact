struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Cell;
    f: Slice;
    g: Address;
    h: String;
    i: Int;
    j: Bool;
}

contract WideFields {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: myAddress(),
            h: "hello",
            i: 2,
            j: false,
        };
    }
}