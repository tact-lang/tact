struct SerHints {
    x: Int as uint8;
    y: Int as int16;
    z: Int as uint4;
}

contract HintTest {
    s: SerHints;
    init() {
        self.s = SerHints{ x: 8, y: -16, z: 7 };
    }
}