contract DebugTryCatch {
    receive() {
        try {
            throw(1234);
        } catch (err) {
            dump(err);
        }
    }
}
