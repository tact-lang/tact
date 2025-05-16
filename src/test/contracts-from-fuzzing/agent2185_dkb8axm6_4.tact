struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: Bool?;
    i: Slice?;
    j: Int?;
}

contract WideFieldTest {
    s: WideStruct;

    init() {
        self.s = WideStruct {
            a: 1,
            b: false,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: beginCell(),
            g: myAddress(),
            h: null,
            i: null,
            j: null,
        };
    }
}