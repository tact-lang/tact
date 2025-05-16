struct OptStruct {
    val: Int;
}

contract OptionalNestedField {
    data: OptStruct?;

    init() {
        self.data = OptStruct{ val: 42 };
    }
}