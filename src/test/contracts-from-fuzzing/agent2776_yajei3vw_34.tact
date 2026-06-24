struct Ser {
    x: Int as uint4;
    y: Int as uint8;
    z: Int as uint256;
}

contract SerializedFields {
    s: Ser;
    init() {
        self.s = Ser{ x: 2, y: 3, z: 4 };
    }
}
