struct OptionWrap {
    v: Int?;
}

contract OptInOpt {
    wrap: OptionWrap?;
    init() {
        self.wrap = null;
    }
}