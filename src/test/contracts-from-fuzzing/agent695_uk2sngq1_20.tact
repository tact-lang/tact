struct Serial1 {
    x: Int as uint8;
    y: Int as int16;
    z: Int as coins;
}

contract SerialTest {
    s: Serial1;

    init() {
        self.s = Serial1{ x:1, y:-12, z: 1000000 };
    }
}