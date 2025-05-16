struct Encoded {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint4;
}

contract Serialized {
    f: Encoded;
    init() {
        self.f = Encoded{ x: 12, y: -20, z: 7 };
    }
}