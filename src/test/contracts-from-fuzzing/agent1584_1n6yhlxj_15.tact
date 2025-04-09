struct Opts {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    a: Address?;
}

contract TestContract {
    opts: Opts = Opts{
        i: null,
        b: null,
        s: null,
        c: null,
        a: null,
    };

    receive() {
        self.opts = Opts{
            i: 1,
            b: true,
            s: "hi",
            c: emptyCell(),
            a: myAddress(),
        };
    }
}
