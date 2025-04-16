struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: String;
    h: Bool;
    i: Int;
    j: Slice;
    k: Cell;
    l: String;
}

contract ManyFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "a",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: "b",
            h: false,
            i: 42,
            j: emptyCell().asSlice(),
            k: emptyCell(),
            l: "c",
        };
    }
}
