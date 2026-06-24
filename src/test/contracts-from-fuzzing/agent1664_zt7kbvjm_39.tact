struct Limits {
    small: Int as uint8;
    neg: Int as int8;
}

contract RangeChecks {
    data: Limits;

    init() {
        self.data = Limits{
            small: 999,  // out of uint8 range
            neg: -200    // out of int8 range
        };
    }
}