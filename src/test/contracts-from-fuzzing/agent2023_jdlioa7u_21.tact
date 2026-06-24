contract TestContract {
    bigInt: Int as int257;

    init() {
        self.bigInt = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff; // 256-bit max unsigned
    }
    receive() { let x = self.bigInt; }
}