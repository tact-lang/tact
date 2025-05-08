contract TestSimpleThrowCatch {
    receive() {
        try {
            throw(1234);
        } catch (err) {
            dump(err); // Expected: exit code 1234 dumped
        }
    }
}
