struct MixedBig {
    a: Int;
    b: String?;
    c: Bool;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String;
    h: Address;
    i: Bool;
    j: Int;
}

contract LargeMix {
    info: MixedBig;

    init() {
        self.info = MixedBig{
            a: 1,
            b: null,
            c: true,
            d: null,
            e: null,
            f: false,
            g: "done",
            h: myAddress(),
            i: false,
            j: 777
        };
    }
}