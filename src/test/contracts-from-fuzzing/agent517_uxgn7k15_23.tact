struct ComplexInts {
    small: Int as uint4;
    medium: Int as int32;
    big: Int;
    verybig: Int as int257;
}

contract ComplexIntsContract {
    d: ComplexInts;
    init() {
        self.d = ComplexInts{
            small: 3,
            medium: -100000,
            big: 123456789012345678901,
            verybig: -123456789012345678901234567890
        };
    }
}