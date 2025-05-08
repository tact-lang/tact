struct ManyTypes {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
    i: Slice;
    j: Slice?;
    k: Builder;
    l: Builder?;
    m: String;
    n: String?;
}

contract DifferentTypes {
    data: ManyTypes;
    init() {
        self.data = ManyTypes {
            a: 1,
            b: null,
            c: true,
            d: false,
            e: myAddress(),
            f: null,
            g: emptyCell(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: beginCell(),
            l: null,
            m: "hi",
            n: null
        };
    }
}