struct WeirdSizes {
    tinySigned: Int as int3;
    smallUnsigned: Int as uint7;
}

contract OddSizedInts {
    data: WeirdSizes;

    init() {
        self.data = WeirdSizes{
            tinySigned: -3,
            smallUnsigned: 100,
        };
    }
}