struct Combine {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    bo: Bool?;
    st: String?;
    cl: Cell?;
    slc: Slice?;
    ad: Address?;
}

contract Test {
    v: Combine;

    init() {
        self.v = Combine {
            i: 1,
            b: false,
            s: "hello",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
            bo: null,
            st: null,
            cl: null,
            slc: null,
            ad: null
        };
    }
}