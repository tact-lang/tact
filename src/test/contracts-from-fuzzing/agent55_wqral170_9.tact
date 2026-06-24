struct Opts {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
}

contract OptStructTest {
    opts: Opts;
    init() {
        self.opts = Opts{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
    receive() {}
}