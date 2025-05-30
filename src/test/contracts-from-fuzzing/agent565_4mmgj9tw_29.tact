struct IntSerialize {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
}

contract IntSerContract {
    ser: IntSerialize;
    init() {
        self.ser = IntSerialize{
            a: 5,
            b: 7,
            c: 300,
            d: 65000,
        };
    }
}