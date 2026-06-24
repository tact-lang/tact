contract TestTryCatchRollback {
    x: Int;

    init() {
        self.x = 42;
    }

    receive() {
        // try block: modify state x and then throw
        try {
            self.x = 100;
            throw(1);
        } catch (err) {
            // after catching, x should have been rolled back to 42
            dump(self.x); // expected: 42 (if rollback works correctly)
        }
    }
}
