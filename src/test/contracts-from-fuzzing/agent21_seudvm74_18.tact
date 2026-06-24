contract TryCatchLogTest {
    // Persistent state variable to store the caught error code
    caught: Int as uint32;

    init() {
        self.caught = 0;
    }

    // External receiver with opcode "test log" that attempts to call log with an invalid base
    receive("test log") {
        try {
            // log(num, base): if base < 1, should throw exit code 5
            let l: Int = log(1000, 0);
            self.caught = 999; // if no error, mark failure
        } catch (err) {
            self.caught = err;
        }
    }
}
