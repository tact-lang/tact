struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int?;
    j: Cell?;
}

contract BigFields {
    persistent: BigStruct;

    init() {
        self.persistent = BigStruct{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}