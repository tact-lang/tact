struct OptionalBoolInt {
    flag: Bool?;
    number: Int?;
}

contract OptContract {
    pair: OptionalBoolInt;
    init() {
        self.pair = OptionalBoolInt{
            flag: null,
            number: null
        };
    }
}