struct Opts {
    flag: Bool?;
    str: String?;
    addr: Address?;
    cellRef: Cell?;
    sliceRef: Slice?;
}

contract MassiveOptionals {
    opts: Opts;

    init() {
        self.opts = Opts{
            flag: null,
            str: null,
            addr: null,
            cellRef: null,
            sliceRef: null
        };
    }
}