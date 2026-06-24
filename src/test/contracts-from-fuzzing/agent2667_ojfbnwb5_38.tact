struct FieldsWithSerialization {
    a: Int as int64;
    b: Int as uint4;
    c: Int as uint32;
}

contract SerializationFieldsContract {
    data: FieldsWithSerialization;

    init() {
        self.data = FieldsWithSerialization{a:-100,b:7,c:12345};
    }

    receive() {
        self.data = FieldsWithSerialization{a:0,b:0,c:0};
    }
}