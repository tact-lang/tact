contract TestTry {
    receive() {
        try {
            throw(42);
        } catch (e) {
            dump(e); // Expected to dump 42
        }
    }
}
