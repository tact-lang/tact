struct ManyOpts {
    aa: Int?;
    bb: Bool?;
    cc: String?;
    dd: Slice?;
    ee: Cell?;
    ff: Address?;
}

contract OptionalFields {
    opts: ManyOpts;

    init() {
        self.opts = ManyOpts{
            aa: null,
            bb: true,
            cc: null,
            dd: null,
            ee: null,
            ff: null
        };
    }
}