contract TestTryCatchValid {
    receive() {
        try {
            throw(123);
        } catch (e) {
            dump(e);
        }
    }
}
