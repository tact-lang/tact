struct SerialTest {
    f1: Int as uint8;
    f2: Int as int16;
    f3: Int as coins;
    f4: Int as int64;
}

contract SerialFormats {
    s: SerialTest;

    init() {
        self.s = SerialTest{ f1:1, f2:2, f3:3, f4:4 };
    }
}