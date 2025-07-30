struct SerialOpts {
    a: Int as uint8;
    b: Int?;
    c: Int;
}

contract OptSerial {
    field: SerialOpts;

    init() {
        self.field = SerialOpts{
            a: 1,
            b: null,
            c: 10
        };
    }
}