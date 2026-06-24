struct MixedTypes {
    amount: Int as coins;
    small: Int as uint8;
    large: Int;
    flag: Bool;
    info: String;
}

contract MixedSerialization {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            amount: 1000,
            small: 255,
            large: 1000000,
            flag: true,
            info: "mix"
        };
    }
}