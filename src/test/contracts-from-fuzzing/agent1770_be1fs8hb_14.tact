struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int?;
    g: String?;
    h: Bool?;
    i: Cell?;
    j: Address?;
}

contract MixPersist {
    m: Mix;

    init() {
        self.m = Mix{
            a: 1,
            b: false,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null,
        };
    }
}