struct WeirdSizes {
    a: Int as uint7;
    b: Int as int13;
    c: Int as uint1;
}

contract WeirdSizesTest {
    data: WeirdSizes;

    init() {
        self.data = WeirdSizes{
            a: 50,
            b: -2000,
            c: 1
        };
    }
}