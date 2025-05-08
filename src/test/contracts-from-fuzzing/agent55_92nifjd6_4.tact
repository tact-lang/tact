contract Test {
    receive() {
        try {
            throw(42);
        } catch (e) {
            dump(e);
        }
    }
}
