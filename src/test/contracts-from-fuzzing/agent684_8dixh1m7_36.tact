struct IntChoices {
    a: Int as int64;
    b: Int as uint128;
    c: Int as int256;
}

contract IntChoicesContract {
    val: IntChoices;
    init() {
        self.val = IntChoices {
            a: 0,
            b: 0,
            c: 0,
        };
    }
}