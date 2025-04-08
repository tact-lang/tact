struct TinyInts {
    a: Int as uint1;
    b: Int as int1;
}

contract MinIntsPersisted {
    data: TinyInts;

    init() {
        self.data = TinyInts{
            a: 1,
            b: -1,
        };
    }
}