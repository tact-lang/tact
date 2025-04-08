struct Opts {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Address?;
    f: String?;
}

contract TestContract {
    opts: Opts;

    init() {
        self.opts = Opts{
            a: null,
            b: 5,
            c: true,
            d: null,
            e: myAddress(),
            f: null
        };
    }
}