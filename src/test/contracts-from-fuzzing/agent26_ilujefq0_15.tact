contract OptionalsRuntimeTest {
    // Field is optional and left uninitialized, therefore defaults to null
    opt: Int?;

    receive() {
        try {
            // Attempting to dereference opt, which is null at runtime
            let x: Int = self.opt!!;
            dump(x);
        } catch (exitCode) {
            // Expected exit code is 128: Null reference exception
            dump(exitCode);
        }
    }
}
