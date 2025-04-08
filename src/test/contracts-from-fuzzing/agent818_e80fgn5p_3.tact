struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool;
    l: String;
}

contract ContractWithManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: null,
            d: "d",
            e: null,
            f: "f",
            g: 7,
            h: false,
            i: "i",
            j: 10,
            k: true,
            l: "l"
        };
    }
}