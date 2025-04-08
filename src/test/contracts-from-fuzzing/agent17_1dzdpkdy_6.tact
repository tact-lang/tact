struct SmallInts {
    a: Int as uint5;
    b: Int as uint8;
    c: Int as int16;
}

contract TestContract {
    s: SmallInts;

    init() {
        self.s = SmallInts{
            a: 15,
            b: 255,
            c: -1000,
        };
    }
}