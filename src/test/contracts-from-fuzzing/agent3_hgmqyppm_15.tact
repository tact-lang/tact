contract TestDumpTryCatch2 {
    receive() {
        try {
            throw(123);
        } catch (err) {
            dump(err);
        }
    }
}
