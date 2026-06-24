struct S {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
    d: Int;
}

contract SerialFormats {
    dat: S;

    init() {
        self.dat = S{
            a: 1, b: -2, c: 1000000000, d: -100
        };
    }
}