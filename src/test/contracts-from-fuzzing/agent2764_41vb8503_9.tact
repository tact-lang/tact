struct SerTest {
    ui8: Int as uint8;
    i8: Int as int8;
    ui64: Int as uint64;
    coin: Int as coins;
}

contract SerVaried {
    s: SerTest;

    init() {
        self.s = SerTest{ ui8:1, i8:-1, ui64:123456789, coin: ton("1") };
    }
}