contract OutOfBoundsTest {
    // Persistent state variable with uint8 annotation: valid values 0-255
    var: Int as uint8;

    init() {
        // Assign an out-of-bound intermediate value (underflow) which should
        // not trigger a compile-time error, as only the final assignment is checked.
        self.var = -1;
        // Now assign a valid value
        self.var = 42;
    }

    get fun value(): Int {
        return self.var;
    }
}
