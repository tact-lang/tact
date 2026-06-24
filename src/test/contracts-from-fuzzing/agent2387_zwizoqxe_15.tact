struct FlagsAndNums {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract MixedOptionals {
    data: FlagsAndNums;
    init() {
        self.data = FlagsAndNums{
            a: 5,
            b: true,
            c: null,
            d: false,
        };
    }
}