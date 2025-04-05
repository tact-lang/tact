contract TestTryCatch {
    receive() {
        try {
            throw(1042);
        } catch (err) {
            dump(err);
        }
    }
}
