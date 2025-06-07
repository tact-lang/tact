struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint32;
    h: Bool;
    i: Int;
    j: String;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "Hello",
            d: null,
            e: false,
            f: null,
            g: 1234,
            h: false,
            i: 42,
            j: "World",
        };
    }
}