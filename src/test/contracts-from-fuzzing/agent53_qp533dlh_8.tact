contract TestTryCatchCorrect {
    receive() {
        try {
            throw(42);
        } catch (e) {
            dump(e);
        }
    }
}
