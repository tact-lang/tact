struct Params {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sb: Slice;
    addr: Address;
    f: Int?;
    g: Address?;
    h: Bool?;
    j: String?;
}

contract TestContract {
    p: Params;

    init() {
        self.p = Params{
            i: 1,
            b: true,
            s: "x",
            c: emptyCell(),
            sb: emptyCell().asSlice(),
            addr: myAddress(),
            f: null,
            g: null,
            h: null,
            j: null,
        };
    }
}