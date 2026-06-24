struct SerializationStruct {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int257;
}

contract MixedSerializationStruct {
    field: SerializationStruct = SerializationStruct{ a: 1, b: 2, c: 3 };
}