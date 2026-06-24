struct SerialIntFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
}

contract MixSerialsContract {
    sf: SerialIntFormats;

    init() {
        self.sf = SerialIntFormats{
            a: 255,
            b: -32768,
            c: 4294967295
        };
    }
}