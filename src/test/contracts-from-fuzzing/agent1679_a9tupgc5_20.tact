contract ContradictoryDefaults {
    a: Int as uint8 = 100;

    init() {
        self.a = -42; // violates serialization bounds deliberately
    }

    receive() {}
}