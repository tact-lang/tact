contract AsciiConstant {
    const CODE: Int = ascii("A"); // Expected 65 (0x41)

    receive() {
        let a: Int = self.CODE;
    }
}
