contract LargeNumber {
    a: Int as int257;
    init() {
        self.a = 1 << 200;
    }
}