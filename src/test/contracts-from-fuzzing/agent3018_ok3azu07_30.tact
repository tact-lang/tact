struct NestedSerialization {
    a: Int as uint8;
    b: Bool;
}

contract SerializationInStruct {
    nest: NestedSerialization = NestedSerialization { a: 10, b: true };
}
