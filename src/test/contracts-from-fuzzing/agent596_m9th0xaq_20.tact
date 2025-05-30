struct FieldOrder {
    x: Int as uint8;
    y: Int;
    z: Int as int16;
}

contract OrderTest {
    fo: FieldOrder;

    init() {
        self.fo = FieldOrder{ x: 255, y: 1000000, z: -1000 };
    }
}