contract OptionalSerializationSizes {
    u4Opt: Int? as uint4;
    s64Opt: Int? as int64;
    coinsOpt: Int? as coins;

    init() {
        self.u4Opt = null;
        self.s64Opt = null;
        self.coinsOpt = null;
    }
}