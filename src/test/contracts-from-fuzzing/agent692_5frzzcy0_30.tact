contract JustNumerics {
    big: Int;
    small: Int as int8;
    medium: Int as int32;
    pos: Int as uint16;
    max: Int as int257;

    init() {
        self.big = 1000000000;
        self.small = -5;
        self.medium = 25000;
        self.pos = 65535;
        self.max = 1;
    }
}