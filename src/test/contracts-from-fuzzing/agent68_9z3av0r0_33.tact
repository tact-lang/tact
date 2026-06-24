struct SerialOpts {
    a: Int as int64;
    b: Int?;
    c: Bool?;
    d: Int as uint4;
}

contract SerialOptContract {
    data: SerialOpts;

    init() {
        self.data = SerialOpts{
            a: 1,
            b: null,
            c: null,
            d: 5
        };
    }
}