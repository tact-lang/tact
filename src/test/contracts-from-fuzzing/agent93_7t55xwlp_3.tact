struct NestedStruct {
    nested1: Int;
    nested2: String?;
}

contract ContainsNested {
    nestedField: NestedStruct = NestedStruct{
        nested1: 1,
        nested2: null,
    };
}