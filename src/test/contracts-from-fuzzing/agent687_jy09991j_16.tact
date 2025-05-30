struct SizeCombo {
    a: Int as uint4;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int128;
    e: Int as uint256;
}

contract SerializeCombo {
    combo: SizeCombo;

    init() {
        self.combo = SizeCombo{
            a: 1,
            b: -12,
            c: 123,
            d: -456,
            e: 789
        };
    }
}