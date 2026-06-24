struct OptionAndNested {
    foo: Int?;
    bar: NestedOpt?;
}

struct NestedOpt {
    baz: Int;
}

contract OptionalCombo {
    data: OptionAndNested;

    init() {
        self.data = OptionAndNested{
            foo: null,
            bar: null
        };
    }
}