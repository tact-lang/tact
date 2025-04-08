struct InnerStruct {
    a: Int;
    b: Bool;
}

contract NestedStructField {
    nested: InnerStruct = InnerStruct{ a: 1, b: true };
}