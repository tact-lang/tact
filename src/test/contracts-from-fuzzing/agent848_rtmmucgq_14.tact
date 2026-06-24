struct IntWidths {
    a: Int as int64;
    b: Int as uint8;
    c: Int as int257;
}

contract IntWidthsTest {
    data: IntWidths;

    init() {
        self.data = IntWidths{ a:1, b:2, c:3 };
    }
}