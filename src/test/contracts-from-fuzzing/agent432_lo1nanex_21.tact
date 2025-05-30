contract WrongFieldInit {
    data: Int as uint8 = 300; // 300 exceeds uint8 (0..255), but it's initializer

    init() {
        self.data = 42;
    }
}
