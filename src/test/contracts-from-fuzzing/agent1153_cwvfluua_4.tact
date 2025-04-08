struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int;
    g: Bool;
    h: String;
    i: Address;
    j: Cell;
}

contract ManyFields {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1,
            b: true,
            c: "x",
            d: emptyCell(),
            e: myAddress(),
            f: 2,
            g: false,
            h: "y",
            i: myAddress(),
            j: emptyCell()
        };
    }
}