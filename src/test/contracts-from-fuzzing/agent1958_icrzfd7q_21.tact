struct Serial {
    x: Int as uint16;
    y: Int as int8;
    z: Int as coins;
}

contract Serialization {
    val: Serial;

    init() {
        self.val = Serial{ x: 65535, y: 127, z: 1000000 };
    }
}
