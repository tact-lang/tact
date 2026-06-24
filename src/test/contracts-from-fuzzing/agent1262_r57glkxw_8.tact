struct OptionalNestedStruct {
    foo: Int;
    bar: String;
}

contract OptionalStructContract {
    optField: OptionalNestedStruct?;

    init() {
        self.optField = null;
    }
}