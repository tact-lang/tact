struct BigStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: Address?;
    g: Cell;
    h: Slice?;
    i: String?;
    j: Int;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: null,
            c: "test",
            d: 42,
            e: true,
            f: null,
            g: emptyCell(),
            h: null,
            i: "optional string",
            j: 999
        };
    }
}