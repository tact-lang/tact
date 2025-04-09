struct Complex {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;
}

contract TestContract {
    var: Complex;
    init() {
        self.var = Complex{
            i: 42,
            b: true,
            s: "abc",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            oi: null,
            ob: false,
            os: null,
            oa: null,
        };
    }
}