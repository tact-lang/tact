// mix of int sizes in nested struct
struct IntMix {
    big: Int;
    small: Int as uint8;
}

contract IntMixStore {
    data: IntMix;

    init() {
        self.data = IntMix{
            big: 1 << 200,
            small: 255,
        };
    }
}