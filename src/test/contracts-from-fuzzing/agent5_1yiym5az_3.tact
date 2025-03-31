fun tryTest(): Int {
    try {
        throw(42);
    } catch (_) {
        return 100;
    }
}
