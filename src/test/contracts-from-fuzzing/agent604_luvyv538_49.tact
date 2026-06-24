struct StrWrap {
    s: String?;
}

contract StructOptStr {
    wrap: StrWrap;

    init() {
        self.wrap = StrWrap{ s: null };
    }
}