contract TestContract {
    receive() {
        // try-catch statement: try block throws an exception, then catch block dumps the exit code
        try {
            throw(1042);
        } catch (err) {
            dump(err);
        }
    }
}
