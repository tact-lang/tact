struct SerializationStruct {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int257;
}

struct OptionalNestedStruct {
    nested: SerializationStruct?;
}

contract OptNestedSerializationStruct {
    field: OptionalNestedStruct = OptionalNestedStruct{ nested: null };
}