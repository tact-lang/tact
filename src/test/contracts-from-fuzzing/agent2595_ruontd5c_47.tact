contract LotsofMix {
    ia: Int as int64;
    ua: Int as uint64;
    ib: Int as int128;
    ub: Int as uint128;
    ic: Int as int256;
    ubig: Int as uint256;

    init() {
        self.ia = -1;
        self.ua = 1;
        self.ib = -2;
        self.ub = 2;
        self.ic = -3;
        self.ubig = 3;
    }
}