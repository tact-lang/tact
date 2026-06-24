struct SomeStruct {
    value: Int;
}

contract OptionalLong {
    value: SomeStruct?;
    init() {
        self.value = null;
    }
}