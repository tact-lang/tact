contract TestShift {
    value: Int;

    init() {
        self.value = 1;
    }

    receive() {
        self.value <<= 2;
        dump(self.value); // expected output: 4
    }
}
