struct OptionalStruct {
    val: Int?;
}

contract NestedOptionalStruct {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{
            val: null,
        };
    }
}