struct SerialOrder2 {
    a: Int as int4;
    b: Int as uint64;
    c: Int as uint1;
    d: Int as int257;
}

contract SerialOrderContract2 {
    data: SerialOrder2;

    init() {
        self.data = SerialOrder2{
            a: -8,
            b: 12345678901234,
            c: 1,
            d: -123456789,
        };
    }
}