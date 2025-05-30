struct AsciiWrap {
    a: Int as int8;
    b: Int as uint8;
}

contract SerialTest {
    data: AsciiWrap;
    init() {
        self.data = AsciiWrap{ a:5, b:10 };
    }
}