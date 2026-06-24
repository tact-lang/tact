struct BigStruct {
    a: Int;
    b: Bool;
    c: Cell;
    d: Address;
    e: String;
    f: Bool?;
    g: Cell?;
    h: String?;
    i: Int?;
    j: Bool;
    k: Int;
}

contract ManyFields {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a: 1,
            b: true,
            c: emptyCell(),
            d: myAddress(),
            e: "abc",
            f: null,
            g: null,
            h: null,
            i: null,
            j: false,
            k: 100
        };
    }
}
