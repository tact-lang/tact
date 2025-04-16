struct BigStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Slice;
    i: Address;
    j: Int;
}

contract ManyFields {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "hello",
            f: null,
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: myAddress(),
            j: 42,
        };
    }

    receive() {}
}
