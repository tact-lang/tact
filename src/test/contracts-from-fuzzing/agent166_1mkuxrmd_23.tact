message(123) AmountMsg {
    val: Int as uint32;
}

struct Nested {
    count: Int as int16;
    msg: AmountMsg;
}

contract TestContract {
    d: Nested;

    init() {
        self.d = Nested{
            count: -123,
            msg: AmountMsg{ val: 99 },
        };
    }
}