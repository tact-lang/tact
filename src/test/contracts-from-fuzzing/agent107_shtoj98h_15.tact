struct Serializations {
    a: Int as int64;
    b: Int as uint4;
    c: Int as coins;
    d: Int as uint16;
}

contract TestContract {
    data: Serializations;

    init() {
        self.data = Serializations{
            a: 1,
            b: 3,
            c: 100,
            d: 256
        };
    }
}
