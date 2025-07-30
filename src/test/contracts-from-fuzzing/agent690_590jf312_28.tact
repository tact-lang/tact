struct MultiSerialized {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
    d: Int as uint32;
    e: Int as int128;
}
contract SerializedCombo {
    s: MultiSerialized;

    init() {
        self.s = MultiSerialized{
            a:1,
            b:2,
            c:3,
            d:4,
            e:5
        };
    }
}