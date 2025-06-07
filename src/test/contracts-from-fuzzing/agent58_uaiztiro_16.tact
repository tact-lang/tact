contract MaxMinSerialization {
    small: Int as uint1;   // 0..1
    big: Int as int257;    // -2^256..2^256-1

    init() {
        self.small = 1;
        self.big = 0;
    }
}