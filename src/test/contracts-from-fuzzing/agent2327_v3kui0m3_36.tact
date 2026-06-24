contract ReservedWordField2 {
    receive_bounce: Int;

    init() {
        self.receive_bounce = 1;
    }
}
