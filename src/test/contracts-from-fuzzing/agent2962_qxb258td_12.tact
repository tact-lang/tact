struct FlatMany {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Int;
    j: Int?;
    k: Bool;
    l: Bool?;
}

contract FlatMix {
    big: FlatMany;

    init() {
        self.big = FlatMany{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: "hi",
            f: null,
            g: myAddress(),
            h: null,
            i: 999,
            j: null,
            k: false,
            l: true
        };
    }
}