struct NestedOptionalStruct {
    val: Int?;
}

contract OptStructValOptional {
    optional: NestedOptionalStruct?;

    init() {
        self.optional = null;
    }

    receive() {
        self.optional = NestedOptionalStruct{val: 1};
    }
}