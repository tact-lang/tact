struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint32;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool;
    l: String?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: false,
            f: "f",
            g: 4294967295,
            h: false,
            i: "i",
            j: 123,
            k: true,
            l: null,
        };
    }
}