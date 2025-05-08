struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
}

contract ManyFields {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: 42,
            h: false,
        };
    }
}