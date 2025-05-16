contract Test {
    one: Int as int1;
    two: Int as int8;
    three: Int as int16;
    four: Int as int64;
    five: Int as int128;
    six: Int as int257;

    init() {
        self.one = 0;
        self.two = 1;
        self.three = 2;
        self.four = 3;
        self.five = 4;
        self.six = 5;
    }
}