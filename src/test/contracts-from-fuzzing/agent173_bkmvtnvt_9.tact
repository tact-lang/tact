contract OptSerMulti {
    a: Int? as coins;
    b: Int? as uint16;
    c: Int? as uint256;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
    }
}