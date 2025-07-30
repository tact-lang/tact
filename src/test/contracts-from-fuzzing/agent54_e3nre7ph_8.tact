contract TestTryCatch {
    receive() {
        try {
            throw(42);
        } catch (e) {
            dump(e); // expected to dump 42
        }
    }
}
