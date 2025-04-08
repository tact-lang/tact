struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Address;
    h: Int;
    i: String?;
    j: Bool;
}

contract LotsOfFields {
    big: ManyFields;
    init() {
        self.big = ManyFields{
            a: 1,
            b: false,
            c: "hi",
            d: null,
            e: true,
            f: "there",
            g: myAddress(),
            h: 9999,
            i: null,
            j: true
        };
    }
}