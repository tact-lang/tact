struct OptSerial {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract SerialOptionals {
    optData: OptSerial;

    init() {
        self.optData = OptSerial{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
        };
    }
}