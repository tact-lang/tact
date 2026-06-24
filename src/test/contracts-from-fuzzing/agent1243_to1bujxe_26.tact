contract Test {
    x: Int as int257 = 123;
    y: Int as int16 = -32768;
    z: Int as uint32 = 4294967295;
    init() {
        self.x = 321;
        self.y = 1234;
        self.z = 987654321;
    }
}