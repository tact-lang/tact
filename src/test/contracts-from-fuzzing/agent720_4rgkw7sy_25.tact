struct Serial1 {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerialTest {
    s: Serial1;

    init() {
        self.s = Serial1{ a: 5, b: -5, c: 1000 };
    }
}