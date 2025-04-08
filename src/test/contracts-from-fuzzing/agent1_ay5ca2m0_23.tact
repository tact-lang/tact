struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    addr: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oc: Cell?;
    oaddr: Address?;
}

contract ManyTypesTest {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            i: 1,
            b: true,
            s: "s",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            addr: myAddress(),
            oi: null,
            ob: null,
            os: null,
            oc: null,
            oaddr: null
        };
    }
}
