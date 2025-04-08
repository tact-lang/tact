struct SilentOpts {
    optStr: String?;
    optAddr: Address?;
    optInt: Int?;
}

contract SilentNulls {
    s: SilentOpts;

    init() {
        self.s = SilentOpts{
            optStr: null,
            optAddr: null,
            optInt: null
        };
    }
}