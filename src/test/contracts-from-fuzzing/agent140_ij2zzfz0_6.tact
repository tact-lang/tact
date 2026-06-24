struct OptionalStruct {
    foo: Int;
    bar: Bool?;
}

contract OptionalStructField {
    nestedOpt: OptionalStruct?;

    init() {
        self.nestedOpt = OptionalStruct{
            foo: 321,
            bar: true,
        };
    }

    receive() {}
}