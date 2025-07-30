contract TestAscii {
    // Contract-level constant: ascii conversion of "⚡" should equal 14850721
    const ASCII_VAL: Int = ascii("⚡");

    receive() {
        require(self.ASCII_VAL == 14850721, "ascii conversion failed");
        dump(self.ASCII_VAL);
    }
}
