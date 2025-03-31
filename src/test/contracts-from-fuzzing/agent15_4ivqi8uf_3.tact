contract GetterTest {
    val: Int = 0;

    // Getter function attempts to modify state variable, contrary to the strict reading of documentation
    // However, such modifications are not persistent.
    get fun modifyGetter(): Int {
        self.val = 42;
        return self.val;
    }
}

// No main function is provided as contract instantiation is handled by the blockchain environment
