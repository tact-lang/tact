struct Nested {
    big: Int as uint256;
    small: Int as uint8;
}

contract MixedSerde {
    data: Nested;

    init() {
        self.data = Nested{big: 1, small: 2};
    }
}