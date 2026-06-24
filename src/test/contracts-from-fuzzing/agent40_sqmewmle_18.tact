contract TryUnderscoreCatch {
    receive() {
        try {
            throw(42);
        } catch (_) {
            dump("Caught");
        }
    }
}
