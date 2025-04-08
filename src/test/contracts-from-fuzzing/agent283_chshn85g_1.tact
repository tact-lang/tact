contract SingleFieldInt {
    value: Int;

    init() {
        self.value = 123;
    }

    receive() {
        self.value = self.value + 1;
    }
}