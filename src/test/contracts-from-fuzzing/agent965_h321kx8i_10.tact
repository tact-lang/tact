struct OptionalStruct {
    foo: Int;
    bar: String;
}

contract TestOptional {
    val: OptionalStruct?;

    init() {
        self.val = OptionalStruct{
            foo: 7,
            bar: "test"
        };
    }
}