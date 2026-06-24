struct SerializeMixed {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int128;
}

contract MixedSer {
    s: SerializeMixed;

    init() {
        self.s = SerializeMixed{
            a: 255, b: -1000, c:1000000, d:-123456789012345
        };
    }
}