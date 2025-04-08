contract TestContract {
    tiny: Int as uint4;
    big: Int as int257;
    init() {
        self.tiny = 7;
        self.big = 1234567890;
    }
}