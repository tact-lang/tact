struct Mixed {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
    bu: Builder;
    io: Int?;
    bo: Bool?;
    so: String?;
    ao: Address?;
    co: Cell?;
    slo: Slice?;
    buo: Builder?;
}

contract TestContract {
    m: Mixed;

    init() {
        self.m = Mixed {
            i: 5,
            b: true,
            s: "hello",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
            io: null,
            bo: null,
            so: null,
            ao: null,
            co: null,
            slo: null,
            buo: null
        };
    }
}