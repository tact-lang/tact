struct SerializableNested {
    a: Int as int4;
    b: InnerSerializable;
}

struct InnerSerializable {
    x: Int as uint10;
    y: Int;
}

contract PersistNestedWithSerialization {
    foo: SerializableNested;

    init() {
        self.foo = SerializableNested{
            a: 7,
            b: InnerSerializable{x: 32, y: 123456}
        };
    }
}