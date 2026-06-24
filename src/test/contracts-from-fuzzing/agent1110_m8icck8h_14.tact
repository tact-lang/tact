struct SerialOpts {
    a: Int? as uint8;
    b: Int as uint32;
    c: Bool?;       // bool optional
    d: String?;
}

contract TestContract {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{
            a: null,
            b: 255,
            c: null,
            d: null,
        };
    }
}