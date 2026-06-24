struct IntWithSerialization {
    small: Int as uint8;
    medium: Int as int32;
    big: Int as int257;
}

contract TestContract {
    ints: IntWithSerialization;

    init() {
        self.ints = IntWithSerialization{
            small: 12,
            medium: -34,
            big: 999999999999999999999
        };
    }
}
