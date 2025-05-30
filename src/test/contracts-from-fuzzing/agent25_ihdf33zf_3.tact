contract TestAscii() {
    // Evaluate ascii constant: expecting 14850721
    const MY_CONSTANT: Int = ascii("⚡");

    receive() {
        dump(self.MY_CONSTANT.toString());
    }
}
