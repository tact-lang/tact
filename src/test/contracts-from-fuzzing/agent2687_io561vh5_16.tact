struct SerializationStruct {
    a: Int as int64;
    b: Int as uint64;
    c: Int as coins;
}

contract SerializationStructStorage {
    s: SerializationStruct;

    init() {
        self.s = SerializationStruct{ a: -9, b: 9, c: ton("2") };
    }
}