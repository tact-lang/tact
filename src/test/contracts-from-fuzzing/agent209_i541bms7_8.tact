// Testing struct with mixed serialization annotations
struct MixedSerialization {
    small: Int as uint8;
    mid: Int as uint32;
    big: Int;
}

contract MixedSerContract {
    data: MixedSerialization;

    init() {
        self.data = MixedSerialization{
            small: 200,
            mid: 100000,
            big: 1234567890
        };
    }
}