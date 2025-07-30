contract StateTest {
    // Persistent state variable
    counter: Int;

    // Constructor: initialize state variable and run tests
    init() {
        self.counter = 0;
        // Persistently modify state
        self.modifyState(100); // Sets counter to 100
        // Call getter function; although getter makes a runtime modification,
        // the change should not persist after execution
        let a = self.getCounter();
        dump(a); // Expected output: 101 (ephemeral change)
        let b = self.getCounter();
        dump(b); // Expected output: 101 (getter's change is not persisted)
        // Finally, persistent state should remain as originally set (100)
        dump(self.counter); // Expected output: 100
    }

    // Non-getter function that persistently modifies state
    fun modifyState(n: Int) {
        self.counter = n;
        dump(self.counter); // Expected to dump n
    }

    // Getter function: marked with 'get' attribute. Even if it modifies state locally,
    // the modifications will not persist after the TVM run.
    get fun getCounter(): Int {
        // Ephemeral mutation: increments counter at runtime
        self.counter = self.counter + 1;
        return self.counter;
    }
}

fun main() {
    // In Tact, contracts are deployed externally. The init() function of StateTest
    // will run upon deployment and output the test results. Thus, main remains empty.
    return;
}
