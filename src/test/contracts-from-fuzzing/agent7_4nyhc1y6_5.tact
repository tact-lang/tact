contract TestTryCatch {
    receive() {
        // Using try-catch: try block throws an exit code, catch block catches it
        try {
            throw(42);
        } catch (err) {
            dump(err); // should dump 42
        }
    }
}
