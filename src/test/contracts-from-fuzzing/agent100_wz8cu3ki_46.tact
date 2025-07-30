contract Test47 {
    a: Int as int128 = 0;
    b: Int as uint128 = 1;
    c: Int as int256 = -1;
    d: Int as uint256 = 255;

    init() {
        self.a = -10;
        self.b = 10;
        self.c = -20;
        self.d = 20;
    }
}