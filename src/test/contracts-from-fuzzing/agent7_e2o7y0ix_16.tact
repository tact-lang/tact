contract TestAugmented {
    // Mutable state variable
    value: Int;

    init() {
        self.value = 5;
        self.testOps();
    }

    fun testOps() {
        // Emulate augmented assignments with explicit re-assignment
        self.value = self.value + 5;  // now 10
        dump(self.value);            // Expected: 10
        self.value = self.value - 3;  // now 7
        dump(self.value);            // Expected: 7
        self.value = self.value * 2;  // now 14
        dump(self.value);            // Expected: 14
        self.value = self.value / 2;  // now 7
        dump(self.value);            // Expected: 7
        self.value = self.value % 4;  // now 3, because 7 % 4 = 3
        dump(self.value);            // Expected: 3

        // Bitwise operations: set value to 3 for bitwise tests
        self.value = 3;              // binary: 0b11
        self.value = self.value & 2; // 0b11 & 0b10 = 0b10, should be 2
        dump(self.value);            // Expected: 2
        self.value = self.value | 1; // 0b10 | 0b01 = 0b11, should be 3
        dump(self.value);            // Expected: 3
        self.value = self.value ^ 2; // 0b11 ^ 0b10 = 0b01, should be 1
        dump(self.value);            // Expected: 1
        self.value = self.value << 2; // 0b1 << 2 = 0b100, should be 4
        dump(self.value);            // Expected: 4
        self.value = self.value >> 1; // 0b100 >> 1 = 0b10, should be 2
        dump(self.value);            // Expected: 2
    }

    fun getValue() : Int {
        return self.value;
    }
}

fun main() {
    // Contract's init will run on deployment and perform the tests
    return;
}
