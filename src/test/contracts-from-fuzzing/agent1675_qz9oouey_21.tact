struct HasSerializations {
    i1: Int as int64;
    i2: Int as uint32;
    i3: Int as coins;
}

contract SerializationFields {
    data: HasSerializations;

    init() {
        self.data = HasSerializations{
            i1: 123,
            i2: 12,
            i3: 777
        };
    }
}