struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    opts: ManyOpts = ManyOpts{
        a: null,
        b: null,
        c: null,
        d: null,
        e: null,
        f: null,
    };

    receive() {
        self.opts = ManyOpts{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "text",
        };
    }
}
