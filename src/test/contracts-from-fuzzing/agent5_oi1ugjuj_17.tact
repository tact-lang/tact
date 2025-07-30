contract Test {
    receive() {
        try {
            throw(1042);
        } catch (e) {
            // Dump the exit code thrown
            dump(e);
        }
    }
}
