struct ManyOpts {
    a: Int? = null;
    b: Bool? = null;
    c: Int? = null;
    d: Bool? = null;
    e: String? = null;
}

contract TestContract {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{ a: null, b: null, c: null, d: null, e: null };
    }
}