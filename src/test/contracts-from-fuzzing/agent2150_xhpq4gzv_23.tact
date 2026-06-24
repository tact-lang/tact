// Causing overlapping of serialization sizes
struct WeirdIntSizes {
    a: Int as uint1;
    b: Int as uint256;
    c: Int as uint1;
}

contract TestContract {
    x: WeirdIntSizes;

    init() {
        self.x = WeirdIntSizes{
            a: 1,
            b: 12345,
            c: 0
        };
    }
}