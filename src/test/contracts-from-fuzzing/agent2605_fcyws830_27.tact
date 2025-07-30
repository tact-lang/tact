contract SerializeExtremes {
    i_small: Int as int8;
    i_large: Int as int257;
    u_small: Int as uint1;
    u_large: Int as uint256;

    init() {
        self.i_small = -128;
        self.i_large = -1;
        self.u_small = 1;
        self.u_large = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    }
}
