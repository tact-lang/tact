struct Combination {
    i: Int;
    o: Int?;
    s: String;
    os: String?;
    b: Bool;
    ob: Bool?;
    a: Address;
    oa: Address?;
    c: Cell;
    oc: Cell?;
    sl: Slice;
    osl: Slice?;
}

contract ComboTest {
    data: Combination;
    init() {
        self.data = Combination{
            i: 1,
            o: null,
            s: "str",
            os: null,
            b: true,
            ob: null,
            a: myAddress(),
            oa: null,
            c: emptyCell(),
            oc: null,
            sl: emptyCell().asSlice(),
            osl: null
        };
    }
}
