struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool;
    l: String;
}

contract LotsOfFieldsTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: false,
            f: "f",
            g: 7,
            h: true,
            i: "i",
            j: null,
            k: false,
            l: "l",
        };
    }
}
