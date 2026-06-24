struct VeryWide {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: Cell?;
    k: Address?;
    l: String?;
    m: Slice?;
    n: Builder?;
}

contract TestContract {
    data: VeryWide;

    init() {
        self.data = VeryWide {
            a: 1,
            b: true,
            c: myAddress(),
            d: "test",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null,
            l: null,
            m: null,
            n: null
        };
    }
}
