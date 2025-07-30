contract IntExtremeDefaults {
    small: Int as int8 = 0;
    large: Int as int257 = 0;
    ularge: Int as uint256 = 0;
    coinsval: Int as coins = 0;

    init() {
        self.small = 0;
        self.large = 0;
        self.ularge = 0;
        self.coinsval = 0;
    }
}