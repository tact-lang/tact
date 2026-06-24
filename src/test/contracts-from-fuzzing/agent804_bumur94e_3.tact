struct MixedSerialization {
    small: Int as uint8;
    medium: Int as int64;
    big: Int;
    label: String;
}

contract TestContract {
    mixed: MixedSerialization;

    init() {
        self.mixed = MixedSerialization{
            small: 7,
            medium: -123456789,
            big: 12345678901234567890,
            label: "test"
        };
    }
}
