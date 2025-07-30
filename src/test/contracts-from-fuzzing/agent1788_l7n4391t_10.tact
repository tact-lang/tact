struct Mixed {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
    oi: Int?;
    ob: Bool?;
    oa: Address?;
    oc: Cell?;
    os: Slice?;
    ostr: String?;
}

contract TestContract {
    data: Mixed;
    init() {
        self.data = Mixed{
            i: 1,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "text",
            oi: null,
            ob: false,
            oa: null,
            oc: emptyCell(),
            os: null,
            ostr: "opt"
        };
    }
}