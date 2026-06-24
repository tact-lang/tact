struct Lo {
    x: Int as uint8;
    y: Int as int16;
    z: Int as int64;
}

contract Test {
    val: Lo;

    init() {
        self.val = Lo{
            x: 255,
            y: -32768,
            z: 9223372036854775807,
        };
    }
}
