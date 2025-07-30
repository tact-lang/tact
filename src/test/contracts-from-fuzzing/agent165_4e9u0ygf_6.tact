struct OptStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalStructField {
    maybe: OptStruct?;

    init() {
        self.maybe = OptStruct{
            foo: 55,
            bar: true
        };
    }
}