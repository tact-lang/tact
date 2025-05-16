struct OptionalStruct {
    foo: Int;
    bar: String;
}

contract OptionalStructField {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{
            foo: 1,
            bar: "bar",
        };
    }
}