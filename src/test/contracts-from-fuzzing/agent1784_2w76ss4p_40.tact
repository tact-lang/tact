struct SerialOpts {
    a: Int as uint4;
    b: Int?;
    c: Int as uint8;
    d: Int?;
}

contract SerialOptsContract {
    rec: SerialOpts;

    init() {
        self.rec = SerialOpts{
            a: 3,
            b: null,
            c: 7,
            d: 1
        };
    }
}