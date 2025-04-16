struct Opts {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract MixedOptionals {
    opts: Opts;

    init() {
        self.opts = Opts{
            i: 123,
            b: null,
            s: "hi",
            a: null,
            c: emptyCell(),
            sl: null
        };
    }

    receive() {}
}