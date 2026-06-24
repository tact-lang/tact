contract TestAugAssign {
    value: Int;

    init() {
        self.value = 5;
    }

    receive() {
        self.value += 5;
        dump(self.value);
    }
}
