struct SerialOpts {
    a: Int as uint8;
    b: Int as int4;
    c: Int as coins;
    d: String;
}

contract SerialContract {
    data: SerialOpts;
    init() {
        self.data = SerialOpts{
            a: 5,
            b: -2,
            c: 1000000,
            d: "hello"
        };
    }
}