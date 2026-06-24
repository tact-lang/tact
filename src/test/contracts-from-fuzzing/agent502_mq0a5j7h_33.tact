contract SerialEdge {
    tini: Int as int1;
    tmax: Int as int257;
    umin: Int as uint1;
    umax: Int as uint256;

    init() {
        self.tini = 0;
        self.tmax = 1;
        self.umin = 0;
        self.umax = 1;
    }
}