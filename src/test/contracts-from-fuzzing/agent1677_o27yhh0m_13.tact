struct OptionInner {
    s: String?;
}

contract OptStringStruct {
    optVal: OptionInner;

    init() {
        self.optVal = OptionInner{ s: null };
    }
}