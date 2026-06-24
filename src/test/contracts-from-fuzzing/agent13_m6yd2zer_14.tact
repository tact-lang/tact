contract TestShiftRight {
    value: Int;

    init() {
        self.value = 16;
    }

    receive() {
        self.value >>= 2;
        dump(self.value); // expected output: 4
    }
}
