struct Basic {
    x: Int as uint8;
    y: Int as int16;
    z: Int as coins;
}

contract SerializedFields {
    data: Basic;
    init() {
        self.data = Basic{ x: 42, y: -10, z: 5 };
    }
}