struct Imbalance {
    big: Int as int257;
    small: Int as uint8;
    mid: Int as int128;
}

contract SerializationMix {
    data: Imbalance;

    init() {
        self.data = Imbalance{
            big: -1,
            small: 255,
            mid: 20000000000000000000000000
        };
    }
}