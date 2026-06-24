struct BigStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Cell?;
    j: Address?;
    k: Slice?;
    l: String?;
}

contract ManyTypes {
    field: BigStruct;
    init() {
        self.field = BigStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: "hi",
            g: null,
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
        };
    }
}