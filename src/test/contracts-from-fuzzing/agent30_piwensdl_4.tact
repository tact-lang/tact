struct Multi {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;
}

contract TestContract {
    big: Multi;

    init() {
        self.big = Multi{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: false,
            j: null,
            k: null,
            l: null,
            m: null,
            n: null
        };
    }
}