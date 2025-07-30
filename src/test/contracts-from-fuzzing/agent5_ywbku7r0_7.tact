contract Test {
    receive() {
        // Test try-catch: valid usage
        try {
            throw(100);
        } catch (err) {
            dump(err);
        }
    }
}
