struct Ints {
    smallInt: Int as uint4;
    midInt: Int as int32;
    bigInt: Int as uint128;
    optSmall: Int?; 
}

contract TestContract {
    ints: Ints;

    init() {
        self.ints = Ints{
            smallInt: 7,
            midInt: -12345,
            bigInt: 12345678901234567890,
            optSmall: null
        };
    }
}