contract NonNullAssertionTest {
    receive() {
        let opt: Int? = null;
        try {
            dump(opt!!); // This should throw an exception because opt is null
        } catch (e) {
            dump(e); // Dump the exit code of the exception
        }
        cashback(sender());
    }
}
