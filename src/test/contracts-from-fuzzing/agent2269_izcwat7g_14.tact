struct OptionalStruct {
    val: Int?;
}

contract StructOfOptionalStruct {
    foo: OptionalStruct;

    init() {
        self.foo = OptionalStruct{val: null};
    }
}
