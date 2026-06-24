contract TestAugAssign {
    // State variables to test augmented assignment for Ints and Bools
    counter: Int;
    flag: Bool;

    init() {
        self.counter = 10;
        self.flag = true;
    }

    receive() {
        // Test augmented assignment for Int
        self.counter += 5;  // expected: 15
        self.counter -= 2;  // expected: 13
        self.counter *= 3;  // expected: 39
        self.counter /= 2;  // expected: 19 (integer division)
        self.counter %= 4;  // expected: 19 % 4 = 3

        // Test augmented assignment for Bool
        self.flag &&= false; // expected: false
        self.flag ||= true;  // expected: true (false || true)
    }
}
