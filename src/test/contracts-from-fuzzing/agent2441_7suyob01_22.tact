struct OptionedStruct {
    foo: Int;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructField {
    s: OptionedStruct?;

    init() {
        self.s = null;
    }
}