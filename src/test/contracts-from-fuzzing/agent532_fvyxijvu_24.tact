struct SerialInt {
    v1: Int as int8;
    v2: Int as int16;
    v3: Int as int32;
    v4: Int as uint64;
    v5: Int as int257;
}

contract SerialStructContract {
    data: SerialInt;

    init() {
        self.data = SerialInt{
            v1: 1,
            v2: 2,
            v3: 3,
            v4: 4,
            v5: -5
        };
    }
}