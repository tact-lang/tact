struct SomeStruct {
    x: Int;
}

contract OptionalNullDefault {
    optField: SomeStruct?;

    init() {
        self.optField = null;
    }
}