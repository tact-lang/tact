contract IntBoundsBeforeEnd {
    small: Int as uint4;
    big: Int as int256;

    init() {
        self.small = -1;
        self.small = 5;
        self.big = 57896044618658097711785492504343953926634992332820282019728792003956564819967; // 2^255-1
    }
}