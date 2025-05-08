struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{
            a: null,
            b: null,
            c: null
        };
    }
}