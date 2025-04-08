struct OptionalStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalFieldContract {
    optionalNested: OptionalStruct?;

    init() {
        self.optionalNested = null;
    }
}
