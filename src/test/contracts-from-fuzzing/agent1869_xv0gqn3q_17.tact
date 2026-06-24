struct Opts {
    s: Slice?;
    c: Cell?;
    addr: Address?;
}

contract OptionalReferences {
    o: Opts;

    init() {
        self.o = Opts{
            s: null,
            c: null,
            addr: null
        };
    }
}