struct AllPrimitives {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Builder;
    n: Builder?;
}

contract Test {
    data: AllPrimitives;

    init() {
        self.data = AllPrimitives{
            a: 1,
            b: null,
            c: true,
            d: false,
            e: myAddress(),
            f: null,
            g: "test",
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null,
            m: beginCell(),
            n: null,
        };
    }
}