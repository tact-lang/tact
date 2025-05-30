contract TestVoidCorrected {
    // Test: dump with void value (function with no explicit return)
    fun voidFun() {
        // does nothing
    }

    receive() {
        dump(self.voidFun()); // Expected to print debug message for void
    }
}
