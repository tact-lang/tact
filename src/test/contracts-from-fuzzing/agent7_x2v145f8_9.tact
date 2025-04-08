contract Test9 {
    big1: Int as uint256 = 0;
    big2: Int as int256 = -1;
    big3: Int as int128 = 0;
    big4: Int as uint1 = 1;
    big5: Int as uint8 = 255;
    big6: Int as uint64 = 0;

    init() {
        self.big1 = 42;
    }
}