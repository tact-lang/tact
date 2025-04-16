struct WithManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: Int;
    g: Bool;
    h: String;
    i: Int?;
    j: Bool?;
    k: String;
}

contract TestManyFields {
    data: WithManyFields;

    init() {
        self.data = WithManyFields{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: "x",
            f: 2,
            g: false,
            h: "y",
            i: null,
            j: null,
            k: "z"
        };
    }
}