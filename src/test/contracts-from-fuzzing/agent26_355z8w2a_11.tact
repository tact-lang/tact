contract TestAsciiConstant {
    const CODE: Int = ascii("A");

    receive() {
        if (self.CODE == 65) {
            return;
        }
    }
}
