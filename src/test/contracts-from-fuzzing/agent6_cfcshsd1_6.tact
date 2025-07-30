contract GetterTest {
    // State variable
    value: Int;

    init() {
        self.value = 10;
    }

    // Getter function that modifies the state variable at runtime.
    // According to documentation, getters should not modify state; however, such modifications may occur at runtime though not persist after execution.
    get fun modifyGetter(): Int {
        self.value = self.value + 5;
        return self.value;
    }

    // Getter function that only reads the state variable
    get fun readGetter(): Int {
        return self.value;
    }

    // Receiver function that does not call getters to avoid internal call issues
    receive() {
        // No calls to getters, as getters are off-chain functions
        dump(self.value);
    }
}
