contract RangeTest {
    // Persistent state variable with a uint8 constraint (0-255)
    val: Int as uint8;

    init() {
        // Intermediate assignment that is out of range, but final assignment is in range
        self.val = 300; // this out-of-range value is overwritten
        self.val = 50;  // final value is within the 0-255 range
    }

    // Getter function to read the state variable
    get fun getVal(): Int {
        return self.val;
    }

    // Dummy receiver to allow deployment
    receive() { }
}

fun main() {
    // The main function is empty because we are testing contract state initialization
    dump(1);
}
