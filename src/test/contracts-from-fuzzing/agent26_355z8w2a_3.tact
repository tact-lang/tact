contract TestConstant {
    const MY_CONSTANT: Int = 42;

    receive() {
        if (self.MY_CONSTANT == 42) {
            return;
        }
    }
}
