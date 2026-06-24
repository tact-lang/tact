contract TestAugAssign {
    value: Int;

    init() {
        self.value = 5;
    }

    receive() {
        // Testing augmented assignment for addition (value += 2 should equal value = 5 + 2)
        self.value += 2;
        dump(self.value);
    }
}
