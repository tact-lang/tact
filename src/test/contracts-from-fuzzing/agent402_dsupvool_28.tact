struct TinyInts {
    a: Int as int3;
    b: Int as uint5;
}

contract TestContract {
    ti: TinyInts;

    init() {
        self.ti = TinyInts{
            a: -3,
            b: 31,
        };
    }
}