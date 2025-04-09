struct Packed {
    x: Int as uint8;
    y: Int as uint8;
    z: Int as uint8;
    w: Int as uint8;
}

contract PackedFields {
    data: Packed;

    init() {
        self.data = Packed{x:1,y:2,z:3,w:4};
    }
}