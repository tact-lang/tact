contract Test {
    receive() {
        // try...catch with throw
        try {
            throw(100);
        } catch (err) {
            dump(err);
        }
    }
}
