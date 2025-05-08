struct OptionOuter {
    inner: Int?;
}

contract OuterOptional {
    s: OptionOuter?;

    init() {
        self.s = OptionOuter{ inner: 77 };
    }
}