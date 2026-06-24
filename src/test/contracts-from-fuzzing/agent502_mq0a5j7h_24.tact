struct OptionPair {
    a: Int?;
    b: Bool?;
}

contract OptionalPair {
    pair: OptionPair;

    init() {
        self.pair = OptionPair{
            a: null,
            b: null,
        };
    }
}