contract OutOfBoundInit {
    b: Int as uint8; // 0..255
    s: Int as int4; // -8..7

    init() {
        self.b = 300;  // overflow for uint8
        self.s = -10;  // overflow for int4
    }

    receive() {
        let _ = self.b;
        let _ = self.s;
    }
}