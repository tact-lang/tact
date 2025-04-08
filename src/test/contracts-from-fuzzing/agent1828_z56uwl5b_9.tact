struct WeirdInts {
    a: Int as int1;
    b: Int as int7;
    c: Int as uint11;
    d: Int as uint23;
    e: Int as int57;
}

contract TestContract {
    weird: WeirdInts;

    init() {
        self.weird = WeirdInts{
            a: 1,
            b: 3,
            c: 11,
            d: 23,
            e: 57
        };
    }
}