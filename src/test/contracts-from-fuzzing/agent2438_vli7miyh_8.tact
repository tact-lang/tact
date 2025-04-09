struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Cell?;
    i: Address;
    j: Address?;
}

contract MixedFields {
    storage: S;

    init() {
        self.storage = S{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: null,
            f: null,
            g: emptyCell(),
            h: null,
            i: myAddress(),
            j: null
        };
    }
}
