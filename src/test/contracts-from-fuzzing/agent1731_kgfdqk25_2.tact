struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract Test {
    s: BigStruct;

    init() {
        self.s = BigStruct{
            a: 1,
            b: true,
            c: "str",
            d: emptyCell(),
            e: myAddress(),
            f: 2,
            g: false,
            h: null,
            i: null,
            j: null
        };
    }
}
