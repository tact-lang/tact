contract TestTryValid {
    receive() {
        try {
            throw(42);
        } catch (err) {
            dump(err);
        }
    }
}
