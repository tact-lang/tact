struct SerialOpts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract SerialTest {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{ a:1, b:-2, c:3 };
    }
}