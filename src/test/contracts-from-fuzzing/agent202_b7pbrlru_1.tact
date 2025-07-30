contract OneBigField {
    big: Int;
    init() {
        self.big = 1;
    }
    receive() {
        self.big = self.big + 1;
    }
}