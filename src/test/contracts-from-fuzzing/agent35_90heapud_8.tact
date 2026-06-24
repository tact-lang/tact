struct OptionalNestedStruct {
    val: Int?;
    nested: String?;
}

contract OptionalNestedPersistent {
    optNested: OptionalNestedStruct = OptionalNestedStruct{
        val: null,
        nested: null
    };
}