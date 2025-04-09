struct OptionWrap {
    v: Int?;
}

contract OptionalNested {
    wrapper: OptionWrap;

    init() {
        self.wrapper = OptionWrap{ v: null };
    }
}