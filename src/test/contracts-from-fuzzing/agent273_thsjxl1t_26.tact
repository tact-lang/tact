contract Test26 {
    x: Int as uint4; // 0..15

    init() {
        self.x = -1; // Should fail at runtime if deployed, but allowed to assign during init
        self.x = 10;
    }
}