struct MixedOpts {
    s: Slice?;
    c: Cell?;
    str: String?;
    addr: Address?;
}

contract TestContract {
    m: MixedOpts;

    init() {
        self.m = MixedOpts{
            s: null,
            c: null,
            str: null,
            addr: null
        };
    }
}