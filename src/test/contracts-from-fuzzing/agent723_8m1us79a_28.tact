struct WeirdSizes {
    a: Int as uint1;
    b: Int as uint3;
    c: Int as int5;
    d: Int as uint64;
}

contract TestContract {
    data: WeirdSizes;

    init() {
        self.data = WeirdSizes{
            a:1,
            b:7,
            c:-15,
            d:1234567890,
        };
    }

    receive() {}
}