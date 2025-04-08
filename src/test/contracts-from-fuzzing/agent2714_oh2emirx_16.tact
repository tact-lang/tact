struct SerTest {
    a: Int as uint8;
    b: Int as int64;
}

contract Test16 {
    s: SerTest;

    init() {
        self.s = SerTest{ a: 255, b: -123456 };
    }
}