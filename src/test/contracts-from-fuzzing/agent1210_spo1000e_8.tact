struct HasMany {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Int?;
    f: Bool?;
    g: Address;
    h: Address?;
    i: String;
    j: Cell;
}

contract ManyStructFields {
    s: HasMany;

    init() {
        self.s = HasMany{
            a: 1,
            b: false,
            c: "hi",
            d: emptyCell(),
            e: null,
            f: true,
            g: myAddress(),
            h: null,
            i: "bye",
            j: emptyCell()
        };
    }
}