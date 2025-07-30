trait RequireTest {
    // Function that checks if v > 0, otherwise fails with a custom error exit code
    fun check(v: Int) {
        require(v > 0, "NEGATIVE");
    }
}

contract TestRequire() with RequireTest {
    // Getter that tries to call check(-1) and catches the error
    get fun test(): Int {
        try {
            self.check(-1);
            return 0; // Should never reach here
        } catch (exitCode) {
            return exitCode; // Return the exit code from require()
        }
    }

    receive() {
        let _ = self.test();
        cashback(sender());
    }
}
