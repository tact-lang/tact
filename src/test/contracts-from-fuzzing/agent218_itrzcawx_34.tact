struct SerializeMix {
    _4bit: Int as uint4;
    _32bit: Int as uint32;
    _64bit: Int as uint64;
    _257bit: Int as int257;
}

contract MixedSerializedWidths {
    s: SerializeMix;

    init() {
        self.s = SerializeMix{
            _4bit: 7,
            _32bit: 1234,
            _64bit: 5678,
            _257bit: -9
        };
    }
}