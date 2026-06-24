struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String;
    i: Cell;
    j: Address;
}

contract MixedBigFields {
    info: BigStruct;

    init() {
        self.info = BigStruct{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: true,
            h: "hello",
            i: emptyCell(),
            j: myAddress(),
        };
    }
}