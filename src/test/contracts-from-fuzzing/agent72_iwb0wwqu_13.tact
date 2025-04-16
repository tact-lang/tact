struct Packed {
    x: Int as uint8;
    y: Int as uint16;
    z: Int as int32;
}

contract SerializedFields {
    pack: Packed;

    init() {
        self.pack = Packed{ x: 1, y: 2, z: 3 };
    }
}