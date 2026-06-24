struct SmallInts {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint4;
    d: Int as int16;
    e: Int as uint8;
}

contract FuzzSmallIntStruct {
    data: SmallInts;

    init() {
        self.data = SmallInts{
            a: 5,
            b: 200,
            c: 10,
            d: -1234,
            e: 250
        };
    }
}