struct LotsOfOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
}

contract TestContract {
    big: LotsOfOpts;

    init() {
        self.big = LotsOfOpts {
            a: null,
            b: true,
            c: null,
            d: null,
            e: null,
            f: null,
            g: 7,
            h: false,
            i: "hi",
            j: null,
            k: null,
            l: null
        };
    }

    receive() {}
}