struct MixedTypes {
    i: Int;
    s: String;
    b: Bool;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
    oi: Int?;
    os: String?;
    ob: Bool?;
    oc: Cell?;
    osl: Slice?;
    obu: Builder?;
    oa: Address?;
}

contract MixedTest {
    f: MixedTypes;

    init() {
        self.f = MixedTypes{
            i: 1,
            s: "s",
            b: true,
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            a: myAddress(),
            oi: null,
            os: null,
            ob: null,
            oc: null,
            osl: null,
            obu: null,
            oa: null
        };
    }
}
