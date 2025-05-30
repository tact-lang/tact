struct SerWidths {
    a: Int as uint1;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
}

contract TestContract {
    field: SerWidths;
    init() {
        self.field = SerWidths{
            a: 1,
            b: -1,
            c: 65535,
            d: -12345,
        };
    }
}
