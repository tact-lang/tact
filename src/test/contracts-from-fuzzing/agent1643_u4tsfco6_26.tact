struct SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int257;
    d: Int?;
}

contract PersistFormats {
    st: SerialTest;

    init() {
        self.st = SerialTest{
            a: 100,
            b: -20000,
            c: 5,
            d: null
        };
    }
}