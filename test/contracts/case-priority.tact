contract Priority {
    x: Bool;
    y: Int;

    init() {
        self.x = true || true && true == 5 < 6 << 9 + 7 * 8;
        self.x = true || true && true != 5 > 6 >> 9 - 7 / 8;
        self.x = true || true && true != 5 <= 6 >> 9 - 7 % 8;
        self.x = true || true && true != 5 >= 6 >> 9 - 7 % 8;
        self.y = 1 | 2 ^ 3 & 6 >> 9 - 7 % 8;
        self.x = (true ? true : false) ? 1 : 2;
        self.x = true ? (true ? 1 : 2) : 3;
        self.x = false ? 1 : false ? 2 : 3;
        self.x = +self.x!!;
        self.x = (+self.x)!!;
    }
}
