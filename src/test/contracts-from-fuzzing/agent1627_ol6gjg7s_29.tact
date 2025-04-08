struct FancyFields {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
}

contract FancyFieldsContract {
    f: FancyFields;

    init() {
        self.f = FancyFields{
            a: 12,
            b: -123456,
            c: 789123
        };
    }
}
