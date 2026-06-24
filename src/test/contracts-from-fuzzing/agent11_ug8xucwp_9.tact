contract TestTryCatchValid {
    receive() {
        try {
            dump(1);
        } catch (err) {
            dump(err);
        }
    }
}
