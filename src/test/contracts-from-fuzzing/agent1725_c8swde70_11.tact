struct Serial1 {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
}

contract SerialTest {
    s: Serial1;

    init() {
        self.s = Serial1{ a:1, b:2, c:3, d:4 };
    }
}