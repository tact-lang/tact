contract TestMsgOpcode() {
    // Testing compile-time evaluation of a composite constant expression using crc32()
    // According to documentation, (crc32("Tact") + 42) & 0xFFFF_FFFF should produce 898001897
    const TEST_MSG_OPCODE: Int = (crc32("Tact") + 42) & 0xFFFF_FFFF;

    fun runTest() {
        dump(self.TEST_MSG_OPCODE == 898001897);
    }

    receive() {
        self.runTest();
        cashback(sender());
    }
}
