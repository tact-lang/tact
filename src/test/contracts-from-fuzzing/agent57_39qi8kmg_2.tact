struct Deep {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract ManyTypes {
    deep: Deep;

    init() {
        self.deep = Deep{
            a: 1,
            b: 2,
            c: true,
            d: false,
            e: "hi",
            f: "hello",
            g: emptyCell(),
            h: emptyCell(),
            i: myAddress(),
            j: myAddress(),
        };
    }
}