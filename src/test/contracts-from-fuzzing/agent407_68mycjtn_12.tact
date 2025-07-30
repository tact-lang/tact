struct SerOrderTest {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int;
}

contract OrderContract {
    s: SerOrderTest;
    init() {
        self.s = SerOrderTest{ a:1, b:2, c:3, d:4 };
    }
}
