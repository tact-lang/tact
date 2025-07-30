contract TestTryCatch {
    receive() {
        try {
            throw(1234);
        } catch (err) {
            dump(err);
        }
    }
}
