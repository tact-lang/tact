struct ManyOpts {
    a: Int? = null;
    b: Bool? = true;
    c: Address? = null;
    d: Int? = 55;
    e: Cell? = null;
}

contract TestContract {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{};
    }
}