struct SerializeInts {
    big: Int as int257;
    small: Int as uint8;
    mid: Int as int128;
}

contract TestContract {
    data: SerializeInts;

    init() {
        self.data = SerializeInts{
            big: 1000000000000,
            small: 255,
            mid: -123456789
        };
    }
}