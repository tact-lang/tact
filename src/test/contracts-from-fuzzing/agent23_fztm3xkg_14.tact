contract TestThrowUnless {
    receive() {
        // Using throwUnless to throw if condition is false
        // This should cause an exception and not reach dump(0)
        throwUnless(1024, false);
        dump(0);
        return;
    }
}
