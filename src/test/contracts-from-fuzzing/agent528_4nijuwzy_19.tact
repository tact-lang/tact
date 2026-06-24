contract IntOverflowInit {
    a: Int as uint8;

    init() {
        self.a = 500;  // should cause runtime out of range upon deploy
    }
}
