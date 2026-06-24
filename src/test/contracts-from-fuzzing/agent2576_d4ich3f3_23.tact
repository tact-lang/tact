contract SerializeOverride {
    small: Int as uint4;
    big: Int as int64;

    init() {
        self.small = 7;
        self.big = 42;
    }
}