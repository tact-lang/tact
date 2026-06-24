contract OptSerNullInit {
    x: Int? as uint8;

    init() {
        self.x = 7;
    }

    receive() {}
}