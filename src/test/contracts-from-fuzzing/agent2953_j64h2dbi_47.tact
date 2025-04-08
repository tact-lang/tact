// Struct with mixed serialization directives
struct SerializedFields {
    a: Int as int8;
    b: Int as uint64;
    c: Int;
}

contract PersistSerdeStruct {
    data: SerializedFields;

    init() {
        self.data = SerializedFields{
            a: 5,
            b: 100,
            c: -200
        };
    }
}