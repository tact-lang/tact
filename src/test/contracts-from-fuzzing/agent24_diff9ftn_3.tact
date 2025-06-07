struct BigStruct {
    a: Int;
    b: Int;
    c: Int?;
    d: Bool;
    e: String;
    f: Cell;
    g: Address;
    h: Bool;
    i: String?;
    j: Int;
}

contract BigFields {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            a: 1, b: 2, c: null, d: true, e: "hi", f: emptyCell(), g: myAddress(), h: false, i: null, j: 42
        };
    }
}