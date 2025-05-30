struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Cell;
    f: Slice;
    g: Cell;
    h: Slice;
    i: Address;
    j: String;
}

contract ManyFields {
    huge: BigStruct;

    init() {
        self.huge = BigStruct{
            a: 1,
            b: 2,
            c: true,
            d: false,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: emptyCell(),
            h: emptyCell().asSlice(),
            i: myAddress(),
            j: "hello"
        };
    }
}