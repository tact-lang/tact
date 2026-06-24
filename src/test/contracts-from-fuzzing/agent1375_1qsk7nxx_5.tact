struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: String;
    i: Bool;
    j: Cell;
}

contract BigNestedStruct {
    field: BigStruct;
    note: String;

    init() {
        self.field = BigStruct{
            a: 10,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: "y",
            i: false,
            j: emptyCell(),
        };
        self.note = "done";
    }
}