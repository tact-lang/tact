contract IntSizes {
    small: Int as int8 = 0;
    medium: Int as int128 = 0;
    large: Int as int257 = 0;

    init() {
        self.small = 100;
        self.medium = 100000;
        self.large = 1000000000;
    }
}