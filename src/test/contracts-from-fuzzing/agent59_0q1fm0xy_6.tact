contract TestTryCatch {
    receive() {
        try {
            throw(101);
        } catch (err) {
            dump(err);
        }
    }
}
