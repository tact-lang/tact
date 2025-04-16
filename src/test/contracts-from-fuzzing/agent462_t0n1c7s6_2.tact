struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String;
    h: Bool;
    i: Int;
    j: String?;
}

contract WideContract {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a: 1,
            b: true,
            c: "c",
            d: myAddress(),
            e: null,
            f: false,
            g: "g",
            h: true,
            i: 100,
            j: null
        };
    }
}