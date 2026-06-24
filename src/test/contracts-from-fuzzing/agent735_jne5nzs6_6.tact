struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalNestedStructField {
    nestedOpt: OptionalStruct?;

    init() {
        self.nestedOpt = OptionalStruct{
            foo: 42,
            bar: true,
        };
    }
}
