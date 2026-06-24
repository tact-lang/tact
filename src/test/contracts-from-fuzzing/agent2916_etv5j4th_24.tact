contract SerializeWidths {
    tiny: Int as uint1;
    small: Int as int8;
    medium: Int as uint64;
    big: Int;

    init() {
        self.tiny = 1;
        self.small = -5;
        self.medium = 1000;
        self.big = 99999;
    }
}