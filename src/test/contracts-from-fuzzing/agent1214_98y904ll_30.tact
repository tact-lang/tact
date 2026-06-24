contract Test30 {
    a: Int as uint128;
    b: Int as int128 = -5;

    init() {
        self.a = 123456789;
    }
}