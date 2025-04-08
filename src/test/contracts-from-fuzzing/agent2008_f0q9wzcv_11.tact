struct ZeroPartialDefaults {
    n: Int;
    m: Int = 42;
}

contract PartialDefaults {
    s: ZeroPartialDefaults;

    init() {
        self.s = ZeroPartialDefaults{n: 11};
    }
}
