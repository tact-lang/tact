struct ManyOpts {
    i: Int?;
    b: Bool?;
    a: Address?;
    s: String?;
    c: Cell?;
}

contract OptsStored {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{
            i: null,
            b: false,
            a: myAddress(),
            s: null,
            c: emptyCell()
        };
    }
}