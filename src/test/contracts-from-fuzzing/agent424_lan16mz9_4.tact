struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: String?;
}

contract ContractWithManyFields {
    store: ManyFields;

    init() {
        self.store = ManyFields{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: "test",
            f: null,
            g: 5,
            h: 100,
            i: false,
            j: "hello",
        };
    }
}