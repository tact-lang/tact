struct Diverse {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Builder;
    h: Cell?;
    i: Address?;
    j: Slice?;
    k: Builder?;
    l: String?;
    m: Bool?;
    n: Int?;
}

contract FullVariety {
    d: Diverse;
    init() {
        self.d = Diverse{
            a: 1,
            b: true,
            c: "c",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null,
            n: null,
        };
    }
}