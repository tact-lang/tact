struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int as int128;
    h: Int as uint128;
    i: Int;
    j: Bool;
    k: String;
}

contract BigData {
    payload: Big;

    init() {
        self.payload = Big{
            a: 1,
            b: true,
            c: "c",
            d: null,
            e: null,
            f: false,
            g: -1000,
            h: 1000,
            i: 2,
            j: false,
            k: "done"
        };
    }
}